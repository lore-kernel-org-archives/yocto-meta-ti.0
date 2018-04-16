Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0114E00C4B; Mon, 16 Apr 2018 13:35:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91EDCE00A6A
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 13:34:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3GKYNDv006017
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 15:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523910863;
	bh=9dcOFo3CdqqKwz9rbxLYTVSn7GJdKsy3gUTjrwxQEo0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vFJ8xKTGLgrk4vQ7IoVGCQZ/ZTf4U1OFvaTyyNZtak+5U2dFoJt3OsjL2VB2OCngE
	sqd2deROeqho3X4be5gRnEZMvKvRmz98fYTrtoNmYaUUgr479WFhAAx6JHbMF51NAL
	ygwuHluIhMiZeUfJWgyDagyXeQX6GTQdefhDIB88=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GKYNYb004685
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 15:34:23 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 16 Apr 2018 15:34:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 16 Apr 2018 15:34:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GKYNB5015283;
	Mon, 16 Apr 2018 15:34:23 -0500
Date: Mon, 16 Apr 2018 16:34:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20180416203422.GF7580@edge>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
	<20180413182408.GA7580@edge>
	<fe18bc077cd844fa80e00efc970a0249@ti.com>
	<20180416200222.GD7580@edge>
	<746e246f47fd4cf39e0f82ee57db9386@ti.com>
	<1655aafd2e9d41d2b67e3dc149791e57@ti.com>
	<20180416202931.GE7580@edge>
	<78389a1ca94d4b319e8cf21f3c0acd9a@ti.com>
MIME-Version: 1.0
In-Reply-To: <78389a1ca94d4b319e8cf21f3c0acd9a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] Re: [rocko/master][PATCH 00/23] TI RTOS Updates
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
X-List-Received-Date: Mon, 16 Apr 2018 20:35:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 16, 2018 at 04:31:42PM -0400, Stiffler, Jacob wrote:
>    > -----Original Message-----
>    > From: Dmytriyenko, Denys
>    > Sent: Monday, April 16, 2018 4:30 PM
>    > To: Stiffler, Jacob
>    > Cc: meta-ti@yoctoproject.org
>    > Subject: Re: [EXTERNAL] Re: [meta-ti] [rocko/master][PATCH 00/23] TI
>    RTOS
>    > Updates
>    >
>    > On Mon, Apr 16, 2018 at 04:26:30PM -0400, Stiffler, Jacob wrote:
>    > >    > -----Original Message-----
>    > >    > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>    > >    > bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
>    > >    > Sent: Monday, April 16, 2018 4:12 PM
>    > >    > To: Dmytriyenko, Denys
>    > >    > Cc: meta-ti@yoctoproject.org
>    > >    > Subject: [EXTERNAL] Re: [meta-ti] [rocko/master][PATCH 00/23] TI
>    RTOS
>    > >    > Updates
>    > >    >
>    > >    >
>    > >    >
>    > >    > > -----Original Message-----
>    > >    > > From: Dmytriyenko, Denys
>    > >    > > Sent: Monday, April 16, 2018 4:02 PM
>    > >    > > To: Stiffler, Jacob
>    > >    > > Cc: meta-ti@yoctoproject.org
>    > >    > > Subject: Re: [meta-ti] [rocko/master][PATCH 00/23] TI RTOS
>    Updates
>    > >    > >
>    > >    > > How severe are the issues? I was planning on pulling them into
>    > >    > > rocko-next tonight, but if there was breakage, the set won't
>    get
>    > >    > > merged to rocko anyway.
>    > >    > > So, if you already have fixes, you can re-spin and resubmit the
>    entire
>    > >    > series.
>    > >    > > If the issues are minor, it's up to you - you can wait until
>    the set
>    > >    > > is merged to rocko and then follow up with your fixes on top...
>    > >    > >
>    > >    >
>    > >    > It is nothing that will break linux targets, and the fixes are
>    only to
>    > >    add a
>    > >    > missing dependency for traceframework and nimu-rtos.
>    > >    >
>    > >
>    > >    Traceframework-rtos cannot be fixed yet as it is missing a
>    dependent
>    > >    recipe. So it is only a minor fix to transport-rtos.
>    > >
>    > >    Would you prefer the whole patch set, or just a single v2?
>    >
>    > If this doesn't affect Linux builds, we can go ahead with this set and
>    merge
>    > the fix later.
>    >
> 
>    I just want to make sure I submit it now so I don't have to spend the time
>    coming back to it, or I forget about it.
> 
>    Do you mind if I submit it as a separate patch on top of the set?

Sure, go ahead. Let's just hope I don't have to drop the entire set while 
testing in rocko-next... :)

>    > >    > I'll just send out the set again to get it in.
>    > >    >
>    > >    > >
>    > >    > > On Mon, Apr 16, 2018 at 03:53:48PM -0400, Stiffler, Jacob
>    wrote:
>    > >    > > >    Denys,
>    > >    > > >
>    > >    > > >    Will you be applying these soon? I have some fixes for
>    issues
>    > >    exposed
>    > >    > by
>    > >    > > >    the migration to rocko.
>    > >    > > >
>    > >    > > >    Thanks,
>    > >    > > >    Jake
>    > >    > > >
>    > >    > > >    > -----Original Message-----
>    > >    > > >    > From: Dmytriyenko, Denys
>    > >    > > >    > Sent: Friday, April 13, 2018 2:24 PM
>    > >    > > >    > To: Stiffler, Jacob
>    > >    > > >    > Cc: meta-ti@yoctoproject.org
>    > >    > > >    > Subject: Re: [meta-ti] [rocko/master][PATCH 00/23] TI
>    RTOS
>    > >    Updates
>    > >    > > >    >
>    > >    > > >    > Thanks Jake and Mahesh! I'll merge the series to
>    rocko-next and
>    > >    give
>    > >    > it
>    > >    > > >    a try.
>    > >    > > >    >
>    > >    > > >    >
>    > >    > > >    > On Fri, Apr 13, 2018 at 01:01:56PM -0400, Jacob Stiffler
>    wrote:
>    > >    > > >    > >
>    > >    > > >    > > Mahesh Radhakrishnan (23):
>    > >    > > >    > >   common-csl-ip: Updating to version 03.03.00.10
>    > >    > > >    > >   emac-lld-rtos: Updating to version 01.00.03.10A
>    > >    > > >    > >   edma3-lld:Updating to version 02.12.05.30C
>    > >    > > >    > >   fatfs-rtos: Updating to version 01.00.00.09
>    > >    > > >    > >   gpio-lld-rtos: Updating to version 01.00.00.10
>    > >    > > >    > >   i2c-lld-rtos: Updating to version 01.00.00.10 &
>    dependency
>    > >    updates
>    > >    > > >    > >   icss-emac-lld: Updating to version 01.00.00.11B
>    > >    > > >    > >   mcasp-lld-rtos: Update to version 01.01.00.09
>    > >    > > >    > >   mcbsp-lld-rtos:Updating to version 01.00.00.09
>    > >    > > >    > >   mmcsd-lld-rtos: Update to version 01.00.00.11
>    > >    > > >    > >   pcie-lld-rtos: Update to version 02.02.00.12
>    > >    > > >    > >   pruss-lld: Updating to version 01.00.00.09A
>    > >    > > >    > >   pm-lld-rtos: Updating to version 01.04.00.04 &
>    01.08.00.17
>    > >    for
>    > >    > > >    > >     am57xx/dra7xx
>    > >    > > >    > >   sa-lld: Updating to version 03.00.00.20
>    > >    > > >    > >   serdes-diag-rtos: Update to version 01.00.00.10
>    > >    > > >    > >   spi-lld-rtos: Update to version 01.00.00.10A
>    > >    > > >    > >   uart-lld-rtos: Updating to version 01.00.00.10A
>    > >    > > >    > >   usb-lld-rtos: Update to version 01.00.00.13
>    > >    > > >    > >   board-rtos: Updating to version 01.00.10.00A
>    > >    > > >    > >   transport-rtos: Udpate to version 1.0.0.11A
>    > >    > > >    > >   osal: Update to version 01.00.00.10A
>    > >    > > >    > >   starterware:starterware-rtos: Udpate to version
>    > >    02.01.01.06C & rtos
>    > >    > > >    > >     updates
>    > >    > > >    > >   ti-pdk-build-rtos: Updating to version 01.00.00.08E
>    which
>    > >    uses
>    > >    > make
>    > >    > > >    > >     install internally
>    > >    > > >    > >
>    > >    > > >    > >  recipes-bsp/board-rtos/board-rtos_git.bb           | 
>    13 +-
>    > >    > > >    > >  .../common-csl-ip/common-csl-ip-rtos_git.bb       
>    |   2 +-
>    > >    > > >    > >  recipes-bsp/common-csl-ip/common-csl-ip.inc       
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/edma3-lld/edma3-lld.inc               
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/emac-lld/emac-lld-rtos_git.bb         
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb          
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb         
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            | 
>    12 +-
>    > >    > > >    > >  recipes-bsp/icss-emac-lld/icss-emac-lld.inc       
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb       
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb       
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb       
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/osal/osal.inc                         
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb         
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/pm-lld/pm-lld-rtos_git.bb              | 
>    12 +-
>    > >    > > >    > >  recipes-bsp/pruss-lld/pruss-lld.inc               
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/sa-lld/sa-lld.inc                     
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb   
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/spi-lld/spi-lld-rtos_git.bb           
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/starterware/starterware-rtos_git.bb   
>    |   7 +-
>    > >    > > >    > >  recipes-bsp/starterware/starterware.inc           
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb   
>    |   2 +-
>    > >    > > >    > >  recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb  
>    |   2 +-
>    > >    > > >    > >  recipes-bsp/transport-rtos/nimu-rtos_git.bb       
>    |   2 +-
>    > >    > > >    > >  recipes-bsp/transport-rtos/transport.inc          
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/uart-lld/uart-lld-rtos_git.bb         
>    |   6 +-
>    > >    > > >    > >  recipes-bsp/usb-lld/usb-lld-rtos_git.bb           
>    |   6 +-
>    > >    > > >    > >  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   |
>    199
>    > >    > > >    +--------------------
>    > >    > > >    > >  28 files changed, 97 insertions(+), 268 deletions(-)
>    > >    > > >    > >
>    > >    > > >    > > --
>    > >    > > >    > > 2.7.4
>    > >    > > >    > >
>    > >    > > >    > > --
>    > >    > > >    > > _______________________________________________
>    > >    > > >    > > meta-ti mailing list
>    > >    > > >    > > meta-ti@yoctoproject.org
>    > >    > > >    > > https://lists.yoctoproject.org/listinfo/meta-ti
>    > >    > --
>    > >    > _______________________________________________
>    > >    > meta-ti mailing list
>    > >    > meta-ti@yoctoproject.org
>    > >    > https://lists.yoctoproject.org/listinfo/meta-ti

