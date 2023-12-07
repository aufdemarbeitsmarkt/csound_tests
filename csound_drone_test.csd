<CsoundSynthesizer>

<CsOptions>
-o WriteToDisk1.wav -W
</CsOptions>

<CsInstruments>
sr 		= 		44100
kr 		= 		4410
ksmps 	= 		10
nchnls 	= 		1
instr   122
    idur	=		p3
    iamp	=		ampdb(p4)
    ifrq	=		cpspch(p5)
    ifun	=		p6
    iatk	=		p7
    idecay	=		p8
    iatkfun	=		p9				
    index1	=		p10
    index2	=		p11
    kenv	envlpx	iamp, iatk, idur, idecay, iatkfun, .7, .01
    kmodswp	expon	index1, idur, index2
    kbuzswp expon   20, idur, 1
    asig3   foscil 	kenv*0.2, ifrq, 1, 1, kmodswp, ifun
    asig2   buzz   	kenv*0.25, ifrq*0.499*(kbuzswp*0.5), kbuzswp+1, ifun
    asig1 	pluck 	iamp, ifrq*.5, ifrq, 0, 1
    amix	=		asig1+asig2+asig3
            out     amix
            ; dispfft	amix, .25, 1024
endin
</CsInstruments>

<CsScore>
f1  0 4096 10   1    
f10 0 513  5   .01  64   1   64   .5   64  .99  64   .6  64  .98  64  .7  64 .97  32  .8  32 1

;ins	    st  	dur     amp	    frq		fun	    atk	    decay	atkfun indx1 indx2	
;====================================================================================
i 122		0       4   	 70	    7.09	 1      .01	    .2	    10	   1 	  30		
i 122		0.05	  4.01	 65	    7.11	 1      .21	    .5	    10	   30 	  60	
</CsScore>

</CsoundSynthesizer>
