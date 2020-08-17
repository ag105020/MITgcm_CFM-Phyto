C $Header$
C $Name$

#ifdef ALLOW_GUD

CBOP
C    !ROUTINE: GUD_DIAGS.h
C    !INTERFACE:
C #include GUD_DIAGS.h

C    !DESCRIPTION:
C Contains indices into diagnostics array

      integer iPP
      integer iNfix
      integer iDenit
      integer iDenitN
#ifdef GUD_MACROMOLECULAR_GROWTH
      integer iPChl, iPC, iVN
      integer iCChl, iNChl, iNPho, iNSyn, iNPrn, iNRNA, iNDNA, iNSTO,
     & iNEXC
      integer iPRNA, iPDNA, iPTHY, iPCON, iPSTO, iPEXC
      integer iFPHO, iFSTO, iFEXC
      integer iMODE, iFe_C, iexQc, iPCg
#endif
      integer iPPplank
      integer iGRplank
      integer gud_nDiag
      PARAMETER(iPP=      1)
      PARAMETER(iNfix=    2)
      PARAMETER(iDenit=   3)
      PARAMETER(iDenitN=  4)
#ifdef GUD_MACROMOLECULAR_GROWTH
      PARAMETER(iPChl=    5)
      PARAMETER(iPC=     iPChl+nPhoto)
      PARAMETER(iVN=     iPC  +nPhoto)
      PARAMETER(iMODE=   iVN  +nPhoto)
      PARAMETER(iFe_C=   iMODE+nPhoto)
      PARAMETER(iexQc=   iFe_C+nPhoto)
      PARAMETER(iPCg =   iexQC+nPhoto)

      PARAMETER(iCChl=   iPCg  +nPhoto)
      PARAMETER(iNChl=   iCChl+nPhoto)
      PARAMETER(iNPho=   iNChl+nPhoto)
      PARAMETER(iNSyn=   iNPho+nPhoto)
      PARAMETER(iNPrn=   iNSyn+nPhoto)
      PARAMETER(iNRNA=   iNPrn+nPhoto)
      PARAMETER(iNDNA=   iNRNA+nPhoto)
      PARAMETER(iNSTO=   iNDNA+nPhoto)
      PARAMETER(iNEXC=   iNSTO+nPhoto)
      PARAMETER(iPRNA=   iNEXC+nPhoto)
      PARAMETER(iPDNA=   iPRNA+nPhoto)
      PARAMETER(iPTHY=   iPDNA+nPhoto)
      PARAMETER(iPCON=   iPTHY+nPhoto)
      PARAMETER(iPSTO=   iPCON+nPhoto)
      PARAMETER(iPEXC=   iPSTO+nPhoto)
      PARAMETER(iFPHO=   iPEXC+nPhoto)
      PARAMETER(iFSTO=   iFPHO+nPhoto)
      PARAMETER(iFEXC=   iFSTO+nPhoto)

      PARAMETER(iPPplank=iFEXC +nPhoto)
#else
      PARAMETER(iPPplank= 7)
#endif
      PARAMETER(iGRplank=iPPplank+nPPplank)
      PARAMETER(gud_nDiag=iGRplank+nGRplank-1)

CEOP
#endif /* ALLOW_GUD */
