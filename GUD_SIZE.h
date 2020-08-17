C $Header$
C $Name$

#ifdef ALLOW_GUD

CBOP
C    !ROUTINE: GUD_SIZE.h
C    !INTERFACE:
C #include GUD_SIZE.h

C    !DESCRIPTION:
C Contains dimensions and index ranges for gud model.
C
C right now, some bits of code assume that
C
C   iMinPhoto = 1
C   iMinPrey = 1
C   iMaxPred = nplank
C   nChl = iMaxPhoto

      integer nplank, nGroup, nlam, nopt
      integer nPhoto
      integer iMinBact, iMaxBact
      integer iMinPrey, iMaxPrey
      integer iMinPred, iMaxPred
      integer nChl
      integer nPPplank
      integer nGRplank
      parameter(nplank=4)
      parameter(nGroup=9)
      parameter(nlam=13)
      parameter(nopt=12)
      parameter(nPhoto=2)
      parameter(iMinBact=nPhoto+1, iMaxBact=nPhoto)
      parameter(iMinPrey=1, iMaxPrey=nplank)
      parameter(iMinPred=2, iMaxPred=nplank)
      parameter(nChl=0)
      parameter(nPPplank=0)
      parameter(nGRplank=0)

CEOP
#endif /* ALLOW_GUD */
