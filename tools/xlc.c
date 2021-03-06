/*

**  ** **     **  ** **     **  ** **    **  ** **     **  ** **     **  ** **  
 ****  **      ****  **      ****  **     ****  **      ****  **      ****  **  
**  ** ****   **  ** ****   **  ** ****  **  ** ****   **  ** ****   **  ** ****

		 Open X Library: Multiple Purpose C Open Engine

                                  **  ** **  
                                   ****  **  
                                  **  ** ****

                   Licensed GPLv3 by Juan Manuel Borges Caño
                  * Homepage <http://code.google.com/p/openxl>
                     * Mail <mailto:juanmabcmail@gmail.com>
                   * Blog <http://juanmabcblog.blogspot.com>
               Copyright (C) 2012 - 2014 Juan Manuel Borges Caño

**  ** **     **  ** **     **  ** **    **  ** **     **  ** **     **  ** **  
 ****  **      ****  **      ****  **     ****  **      ****  **      ****  **  
**  ** ****   **  ** ****   **  ** ****  **  ** ****   **  ** ****   **  ** ****

*/

#include <XL/xl.h>
#include <config.h>

#define _xlIdCompile(Id, identifier, Identifier, Identifiers, IDENTIFIER) \
	case XL_ ## IDENTIFIER ## _METAHEADER_MAGIC: \
	{ \
		XLid id; \
		xlGen ## Identifiers(1, &id); \
		xlBind ## Identifier(id); \
		xlDataLoad(argv[1]); \
		xl ## Id ## Save(argv[2]); \
		xl ## Id ## Unload(); \
		xlDelete ## Identifiers(1, &id); \
		break; \
	}

int
main(int argc, char **argv)
{
	xlLogBanner();

	xlRandSeed(xlTime(NULL));

	if(argc == 3)
    	{
		XLenum type;
		XLid mh;

		type = xlGetPathType(argv[1]);
		if(type == XL_DATA_SOURCE || type == XL_DATA_PROCESS || type == XL_DATA_EXTERNAL)
		{
			xlGenMetaHeaders(1, &mh);
			xlBindMetaHeader(mh);

			xlDataMetaHeader(argv[1]);

			switch(xlGetInteger(XL_METAHEADER_MAGIC))
			{
				xlIdForEach(_xlIdCompile)

				default:
					xlSetError(XL_ERROR_VALUE_INVALID_DATA);
					break;
			}

			xlMetHeadUnload();

			xlDeleteMetaHeaders(1, &mh);
		}
		else
			xlSetError(XL_ERROR_VALUE_INVALID_PARAM);
	}
	else
		xlSetError(XL_ERROR_VALUE_INVALID_PARAM);

	xlDatasRemove();

	xlDebug(__FILE__, __LINE__);

	return EXIT_SUCCESS;
}

#undef _xlIdDecompile
