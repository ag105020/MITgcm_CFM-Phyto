C $Header$
C $Name$

#include "GUD_OPTIONS.h"

CBOP
C     !ROUTINE: GUD_DIAGNOSTICS_INIT

C     !INTERFACE:
      SUBROUTINE GUD_DIAGNOSTICS_INIT( myThid )

C     !DESCRIPTION:
C     Routine to initialize Gud diagnostics

C     !USES:
      IMPLICIT NONE
#include "SIZE.h"
#include "PTRACERS_SIZE.h"
#include "EEPARAMS.h"
#include "PARAMS.h"
#include "GUD_SIZE.h"
#include "GUD_INDICES.h"

C     !INPUT PARAMETERS:
C     myThid :: Number of this instance of GUD_DIAGNOSTICS_INIT
      INTEGER myThid
CEOP

#ifdef ALLOW_GUD
#ifdef ALLOW_DIAGNOSTICS

C     !LOCAL VARIABLES:
C     msgBuf :: Informational/error meesage buffer
c     CHARACTER*(MAX_LEN_MBUF) msgBuf
      INTEGER j
      INTEGER        diagNum
      CHARACTER*8    diagName
      CHARACTER*16   diagCode
      CHARACTER*16   diagUnits
      CHARACTER*(80) diagTitle

C---+----1----+----2----+----3----+----4----+----5----+----6----+----7-|--+----|

      WRITE(diagName,'(A)')'PP'
      WRITE(diagTitle,'(A)')'Primary Production'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'Nfix'
      WRITE(diagTitle,'(A)')'N fixation'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'Denit'
      WRITE(diagTitle,'(A)')'Denitrification'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

#ifdef GUD_MACROMOLECULAR_GROWTH
      DO j = 1, nPhoto

      WRITE(diagName,'(A,I4.4)')'PChl', j
      WRITE(diagTitle,'(A)')'Chl-specific carbohydrate fixation rate'
      diagUnits = 'mol C/mol Chl/s '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PC', j
      WRITE(diagTitle,'(A)')'Carbon-specific growth rate'
      diagUnits = '1/s             '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'VN', j
      WRITE(diagTitle,'(A)')'Carbon-specific nitrogen uptake rate'
      diagUnits = 'mmol N/mmol C/s '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'MODE', j
      WRITE(diagTitle,'(A)')'1: N, 2: P, 3: Fe limitation'
      diagUnits = 'dimensionless  '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'Fe_C', j
      WRITE(diagTitle,'(A)')'Fe/C'
      diagUnits = 'mol Fe/mol C'
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'exQc', j
      WRITE(diagTitle,'(A)')'exQc'
      diagUnits = 's-1'
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PCg', j
      WRITE(diagTitle,'(A)')'PCg'
      diagUnits = 's-1'
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )



      WRITE(diagName,'(A,I4.4)')'CChl', j
      WRITE(diagTitle,'(A)')'C quota in Chlorophyll'
      diagUnits = 'mol C/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NChl', j
      WRITE(diagTitle,'(A)')'N quota in Chlorophyll'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NPho', j
      WRITE(diagTitle,'(A)')'N quota related to photosynthesis'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NSyn', j
      WRITE(diagTitle,'(A)')'N quota related to biosynthesis'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NPrn', j
      WRITE(diagTitle,'(A)')'N quota in proteins'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NRNA', j
      WRITE(diagTitle,'(A)')'N quota in RNA'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NDNA', j
      WRITE(diagTitle,'(A)')'N quota in DNA'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NSTO', j
      WRITE(diagTitle,'(A)')'N quota in Nstore'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'NEXC', j
      WRITE(diagTitle,'(A)')'N quota in Nexcess'
      diagUnits = 'mol N/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PRNA', j
      WRITE(diagTitle,'(A)')'P quota in RNA'
      diagUnits = 'mol P/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PDNA', j
      WRITE(diagTitle,'(A)')'P quota in DNA'
      diagUnits = 'mol P/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PTHY', j
      WRITE(diagTitle,'(A)')'P quota in Thylakoid membrane'
      diagUnits = 'mol P/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PCON', j
      WRITE(diagTitle,'(A)')'P quota a constant part'
      diagUnits = 'mol P/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PSTO', j
      WRITE(diagTitle,'(A)')'P quota in P storage'
      diagUnits = 'mol P/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'PEXC', j
      WRITE(diagTitle,'(A)')'P quota in Pexcess'
      diagUnits = 'mol P/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'FPHO', j
      WRITE(diagTitle,'(A)')'Fe quota in Photosystem'
      diagUnits = 'mol Fe/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'FSTO', j
      WRITE(diagTitle,'(A)')'Fe quota in Festore'
      diagUnits = 'mol Fe/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A,I4.4)')'FEXC', j
      WRITE(diagTitle,'(A)')'Fe quota in Feexcess'
      diagUnits = 'mol Fe/cell      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )


      ENDDO
#endif

#ifdef GUD_ALLOW_RADTRANS
      DO j = 1, nlam
        WRITE(diagName,'(A,I3.3)')'Ed',j
        WRITE(diagTitle,'(A,I2)')'direct irradiance for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'WM P    LR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'Es',j
        WRITE(diagTitle,'(A,I2)')
     &        'diffuse downwelling irradiance for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'WM P    LR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'Eu',j
        WRITE(diagTitle,'(A,I2)')
     &        'diffuse upwelling irradiance for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'WM P    LR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

#ifdef GUD_DIAG_IOP
        WRITE(diagName,'(A,I3.3)')'a',j
        WRITE(diagTitle,'(A,I2)')
     &        'total absorption for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'bt',j
        WRITE(diagTitle,'(A,I2)')
     &        'total scattering for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'bb',j
        WRITE(diagTitle,'(A,I2)')
     &        'total backscattering for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'aCDOM',j
        WRITE(diagTitle,'(A,I2)')
     &        'absorption by CDOM for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
#endif

#ifdef GUD_DIAG_RADTRANS_SOLUTION
        WRITE(diagName,'(A,I3.3)')'Estop',j
        WRITE(diagTitle,'(A,I2)')
     &        'diffuse downwelling irradiance for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'WM P    LR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'Eubot',j
        WRITE(diagTitle,'(A,I2)')
     &        'diffuse upwelling irradiance for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'WM P    LR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'amp1_',j
        WRITE(diagTitle,'(A,I2)')
     &        'amplitude of d-w increasing mode for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM      MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'amp2_',j
        WRITE(diagTitle,'(A,I2)')
     &        'amplitude of d-w decreasing mode for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM      MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'x_',j
        WRITE(diagTitle,'(A,I2)')
     &        'amplitude of direct in diffuse for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM      MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'y_',j
        WRITE(diagTitle,'(A,I2)')
     &        'amplitude of direct in upward for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM      MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'r1_',j
        WRITE(diagTitle,'(A,I2)')
     &        'R coefficient of d-w increasing mode for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM      MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'r2_',j
        WRITE(diagTitle,'(A,I2)')
     &        'R coefficient of d-w decreasing mode for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM      MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'att1_',j
        WRITE(diagTitle,'(A,I2)')
     &        'attenuation of d-w increasing mode for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'att2_',j
        WRITE(diagTitle,'(A,I2)')
     &        'attenuation of d-w decreasing mode for waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
#endif
      ENDDO
#endif /* GUD_ALLOW_RADTRANS */

      WRITE(diagName,'(A)')'atten'
      WRITE(diagTitle,'(A)')'attenuation in layer'
      diagUnits = '1               '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'exfPAR'
      WRITE(diagTitle,'(A)')'PAR at surface'
      diagUnits = 'uEin/m^2/s      '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'surfPAR'
      WRITE(diagTitle,'(A)')'PAR at surface'
      diagUnits = 'uEin/m^2/s      '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PARF'
      WRITE(diagTitle,'(A)')'PAR at top of layer'
      diagUnits = 'uEin/m^2/s      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PAR'
      WRITE(diagTitle,'(A,I2)')'total PAR at layer center'
      diagUnits = 'uEin/m^2/s      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      DO j = 1, nlam
        WRITE(diagName,'(A,I3.3)')'PAR',j
        WRITE(diagTitle,'(A,I2)')'PAR waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
      ENDDO

      DO j = 1, nPPplank
        WRITE(diagName,'(A,I4.4)')'PP',j
        WRITE(diagTitle,'(A,I4)')'Primary Production plankton ',j
        diagUnits = 'mmol C/m^3/s    '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
      ENDDO

      DO j = 1, nGRplank
        WRITE(diagName,'(A,I4.4)')'GR',j
        WRITE(diagTitle,'(A,I4)')'Grazing loss of plankton ',j
        diagUnits = 'mmol C/m^3/s    '
        diagCode  = 'SM P    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
      ENDDO

#ifdef GUD_ALLOW_CARBON
      WRITE(diagName,'(A)')'pH'
      WRITE(diagTitle,'(A)')'pH'
      diagUnits = '1               '
      diagCode  = 'SM      MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'pCO2'
      WRITE(diagTitle,'(A)')'Partial Pressure of CO2'
      diagUnits = 'atm             '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'fluxCO2'
      WRITE(diagTitle,'(A)')'Flux of CO2 - air-sea exch'
      diagUnits = 'mmol C/m2/s     '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'gDICsurf'
      WRITE(diagTitle,'(A)')
     &            'Tendency of DIC due to air-sea exch + oldvirt.flux'
      diagUnits = 'mmol C/m3/s     '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'gALKsurf'
      WRITE(diagTitle,'(A)')'Tendency of ALK due to oldvirt.flux'
      diagUnits = 'mmol eq/m3/s    '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'gO2surf'
      WRITE(diagTitle,'(A)')'Tendency of O2 due to air-sea exch'
      diagUnits = 'mmol O/m3/s     '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )
#endif /* GUD_ALLOW_CARBON */

#endif /* ALLOW_DIAGNOSTICS */
#endif /* ALLOW_GUD */

      RETURN
      END

