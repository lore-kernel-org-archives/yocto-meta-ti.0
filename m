Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74B2DE00A26; Mon, 16 Apr 2018 13:12:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1197AE00843
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 13:12:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3GKC6Mp022047
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 15:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523909526;
	bh=rJBfSMqHAcu1xGM4rKR+k/MDH2bzQ+4EdlmnhZHd5lk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=s+MIU0R0H647L+tb7M8KCgdZ7MzSA9mYdkZDhjUAfgFrf3RN3JduLeCSMziQF4A9T
	kwj8dmUWvQm42GVbsfh6ebWDO3+iBPK7laDWzT6kUxLBNcCzmR3Ec2PRlzxmahrMh5
	KYA9M18m3YHOcdSnaCDmlEzZar8iPzClqOHQMnFQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GKC6D2012442
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 15:12:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 16 Apr 2018 15:12:05 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Mon, 16 Apr 2018 15:12:05 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH 00/23] TI RTOS Updates
Thread-Index: AQHT00qhVuhQmtYqzUatfi1XqrZ1Q6P/VnUAgAR75mCAAFaLAP//rL3Q
Date: Mon, 16 Apr 2018 20:12:05 +0000
Message-ID: <746e246f47fd4cf39e0f82ee57db9386@ti.com>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
	<20180413182408.GA7580@edge> <fe18bc077cd844fa80e00efc970a0249@ti.com>
	<20180416200222.GD7580@edge>
In-Reply-To: <20180416200222.GD7580@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH 00/23] TI RTOS Updates
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
X-List-Received-Date: Mon, 16 Apr 2018 20:12:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, April 16, 2018 4:02 PM
> To: Stiffler, Jacob
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko/master][PATCH 00/23] TI RTOS Updates
>=20
> How severe are the issues? I was planning on pulling them into rocko-next
> tonight, but if there was breakage, the set won't get merged to rocko
> anyway.
> So, if you already have fixes, you can re-spin and resubmit the entire se=
ries.
> If the issues are minor, it's up to you - you can wait until the set is m=
erged to
> rocko and then follow up with your fixes on top...
>=20

It is nothing that will break linux targets, and the fixes are only to add =
a missing dependency for traceframework and nimu-rtos.=20

I'll just send out the set again to get it in.

>=20
> On Mon, Apr 16, 2018 at 03:53:48PM -0400, Stiffler, Jacob wrote:
> >    Denys,
> >
> >    Will you be applying these soon? I have some fixes for issues expose=
d by
> >    the migration to rocko.
> >
> >    Thanks,
> >    Jake
> >
> >    > -----Original Message-----
> >    > From: Dmytriyenko, Denys
> >    > Sent: Friday, April 13, 2018 2:24 PM
> >    > To: Stiffler, Jacob
> >    > Cc: meta-ti@yoctoproject.org
> >    > Subject: Re: [meta-ti] [rocko/master][PATCH 00/23] TI RTOS Updates
> >    >
> >    > Thanks Jake and Mahesh! I'll merge the series to rocko-next and gi=
ve it
> >    a try.
> >    >
> >    >
> >    > On Fri, Apr 13, 2018 at 01:01:56PM -0400, Jacob Stiffler wrote:
> >    > >
> >    > > Mahesh Radhakrishnan (23):
> >    > >   common-csl-ip: Updating to version 03.03.00.10
> >    > >   emac-lld-rtos: Updating to version 01.00.03.10A
> >    > >   edma3-lld:Updating to version 02.12.05.30C
> >    > >   fatfs-rtos: Updating to version 01.00.00.09
> >    > >   gpio-lld-rtos: Updating to version 01.00.00.10
> >    > >   i2c-lld-rtos: Updating to version 01.00.00.10 & dependency upd=
ates
> >    > >   icss-emac-lld: Updating to version 01.00.00.11B
> >    > >   mcasp-lld-rtos: Update to version 01.01.00.09
> >    > >   mcbsp-lld-rtos:Updating to version 01.00.00.09
> >    > >   mmcsd-lld-rtos: Update to version 01.00.00.11
> >    > >   pcie-lld-rtos: Update to version 02.02.00.12
> >    > >   pruss-lld: Updating to version 01.00.00.09A
> >    > >   pm-lld-rtos: Updating to version 01.04.00.04 & 01.08.00.17 for
> >    > >     am57xx/dra7xx
> >    > >   sa-lld: Updating to version 03.00.00.20
> >    > >   serdes-diag-rtos: Update to version 01.00.00.10
> >    > >   spi-lld-rtos: Update to version 01.00.00.10A
> >    > >   uart-lld-rtos: Updating to version 01.00.00.10A
> >    > >   usb-lld-rtos: Update to version 01.00.00.13
> >    > >   board-rtos: Updating to version 01.00.10.00A
> >    > >   transport-rtos: Udpate to version 1.0.0.11A
> >    > >   osal: Update to version 01.00.00.10A
> >    > >   starterware:starterware-rtos: Udpate to version 02.01.01.06C &=
 rtos
> >    > >     updates
> >    > >   ti-pdk-build-rtos: Updating to version 01.00.00.08E which uses=
 make
> >    > >     install internally
> >    > >
> >    > >  recipes-bsp/board-rtos/board-rtos_git.bb           |  13 +-
> >    > >  .../common-csl-ip/common-csl-ip-rtos_git.bb        |   2 +-
> >    > >  recipes-bsp/common-csl-ip/common-csl-ip.inc        |   6 +-
> >    > >  recipes-bsp/edma3-lld/edma3-lld.inc                |   6 +-
> >    > >  recipes-bsp/emac-lld/emac-lld-rtos_git.bb          |   6 +-
> >    > >  recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb           |   6 +-
> >    > >  recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb          |   6 +-
> >    > >  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            |  12 +-
> >    > >  recipes-bsp/icss-emac-lld/icss-emac-lld.inc        |   6 +-
> >    > >  recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb        |   6 +-
> >    > >  recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb        |   6 +-
> >    > >  recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb        |   6 +-
> >    > >  recipes-bsp/osal/osal.inc                          |   6 +-
> >    > >  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb          |   6 +-
> >    > >  recipes-bsp/pm-lld/pm-lld-rtos_git.bb              |  12 +-
> >    > >  recipes-bsp/pruss-lld/pruss-lld.inc                |   6 +-
> >    > >  recipes-bsp/sa-lld/sa-lld.inc                      |   6 +-
> >    > >  recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb    |   6 +-
> >    > >  recipes-bsp/spi-lld/spi-lld-rtos_git.bb            |   6 +-
> >    > >  recipes-bsp/starterware/starterware-rtos_git.bb    |   7 +-
> >    > >  recipes-bsp/starterware/starterware.inc            |   6 +-
> >    > >  recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb    |   2 +-
> >    > >  recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb   |   2 +-
> >    > >  recipes-bsp/transport-rtos/nimu-rtos_git.bb        |   2 +-
> >    > >  recipes-bsp/transport-rtos/transport.inc           |   6 +-
> >    > >  recipes-bsp/uart-lld/uart-lld-rtos_git.bb          |   6 +-
> >    > >  recipes-bsp/usb-lld/usb-lld-rtos_git.bb            |   6 +-
> >    > >  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   | 199
> >    +--------------------
> >    > >  28 files changed, 97 insertions(+), 268 deletions(-)
> >    > >
> >    > > --
> >    > > 2.7.4
> >    > >
> >    > > --
> >    > > _______________________________________________
> >    > > meta-ti mailing list
> >    > > meta-ti@yoctoproject.org
> >    > > https://lists.yoctoproject.org/listinfo/meta-ti

