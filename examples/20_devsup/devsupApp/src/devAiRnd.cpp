/* devAiRnd.cpp - Example device support for Ai record */                                             
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "devSup.h"
#include "recGbl.h"
#include "dbAccessDefs.h"
#include "dbCommon.h"
#include "aiRecord.h"
#include "drvRandom.h"
#include "epicsExport.h"

/* Almost any device needs to maintain some data:
 * Address of hardware, state of communication with device, ...
 * In this case it’s only the upper limit of the random  number generation.
 */
struct devRndData
{
    double upper_limit;
};

static long init_record(dbCommon *common)
{
    aiRecord *rec = (aiRecord *) common;
    devRndData *data;
    
    /* ai.inp must be a CONSTANT, defining the upper limit */
    if (rec->inp.type != CONSTANT)
    {
        recGblRecordError(S_db_badField, rec,
                          "devAiRnd (init_record) Illegal INP field");
        return S_db_badField;
    }
    data = new devRndData();
    recGblInitConstantLink(&rec->inp, DBF_DOUBLE, &data->upper_limit);
    /* device private (dpvt) is where we can park our device data */
    rec->dpvt = data;
    
    return 0;
}

static long read_ai(aiRecord *rec)
{
    devRndData *data = (devRndData *) rec->dpvt;
    if (data)
    {
        rec->val = drvRandom(data->upper_limit);
        rec->udf = FALSE;
    }
    return 2; /* 2 == don’t convert rval to val */
}

/* Create the device support entry table */
aidset devAiRnd =
{
    {
        6,            // Number of methods
        NULL,         // report
        NULL,         // overall init
        init_record,  // init(dbCommon *)
        NULL          // get_ioint_info
    },
    read_ai,          // read(aiRecord *)
    NULL              // special_linconv
};
epicsExportAddress(dset, devAiRnd);
