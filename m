Return-Path: <hozer@grid.coop>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30C9CE009C3; Wed, 27 Jan 2016 14:12:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from nl.grid.coop (nl.grid.coop [50.7.166.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4237E00838
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 14:12:05 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (uid 1000)
	by nl.grid.coop with local; Wed, 27 Jan 2016 16:12:03 -0600
	id 0000000000081126.0000000056A940B3.00004BAA
Date: Wed, 27 Jan 2016 16:12:03 -0600
From: Troy Benjegerdes <hozer@hozed.org>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160127221203.GE2584@nl.grid.coop>
References: <20160116063631.GB10881@nl.grid.coop> <20160118164615.GC4223@edge>
	<20160118200507.GE10881@nl.grid.coop> <20160119190808.GE4223@edge>
	<20160121015830.GA4311@nl.grid.coop> <20160121204813.GD11314@edge>
	<CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
	<20160121220740.GF11314@edge> <20160127215645.GD2584@nl.grid.coop>
	<20160127220316.GZ11314@edge>
Mime-Version: 1.0
In-Reply-To: <20160127220316.GZ11314@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: regression tests for am3517-evm machine?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 22:12:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > So the first problem seems to be that the 'u-boot' target produces
> > a build from the 2014.07 version, which does not seem to have any
> > environment or other setup to load a device tree.
> > 
> > Is there some patch floating around somewhere that updates the
> > default u-boot environment to work better with new kernels, or do
> > I need try and merge something in from the beaglebone
> 
> Can you try u-boot-ti-staging instead?

This is from 'pokey' ( yocto-2.0-121-g2fb7ee2 ),
with meta-ti: ( v2012.05-yocto1.2-938-gd397744 )


U-Boot 2015.07 (Jan 27 2016 - 15:32:32 -0600)
...
AM3517_EVM # printenv
baudrate=115200
bootcmd=mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loaduimai
bootdelay=10
bootfile=uImage
bootscript=echo Running bootscript from mmc ...; source ${loadaddr}
console=ttyO2,115200n8
dieid#=3f42000100000000015da3960e012002
ethact=DaVinci-EMAC
loadaddr=0x82000000
loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr
loaduimage=fatload mmc ${mmcdev} ${loadaddr} uImage
mmcargs=setenv bootargs console=${console} root=/dev/mmcblk0p2 rw rootwait
mmcboot=echo Booting from mmc ...; run mmcargs; bootm ${loadaddr}
mmcdev=0
nandargs=setenv bootargs console=${console} root=/dev/mtdblock4 rw rootfstype=jffs2
nandboot=echo Booting from nand ...; run nandargs; nand read ${loadaddr} 280000 400000; bootm ${loadaddr}
stderr=serial
stdin=serial
stdout=serial





-- 
----------------------------------------------------------------------------
Troy Benjegerdes                 'da hozer'                  hozer@hozed.org
7 elements      earth::water::air::fire::mind::spirit::soul        grid.coop

      Never pick a fight with someone who buys ink by the barrel,
         nor try buy a hacker who makes money by the megahash


