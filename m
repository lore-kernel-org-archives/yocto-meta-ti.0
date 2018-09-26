Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB99EE00A16; Wed, 26 Sep 2018 12:37:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB414E00953
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2018 12:37:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8QJb8wM099672;
	Wed, 26 Sep 2018 14:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537990628;
	bh=1L2b8fQC9miFIwtrscGbgRQ66r9WdiZJGvmBhHA68g8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Uu7P2dz8zrzNhVvQjbCZ3oRgrsyv/zs9zvjOmmrpvXrvM+sybbKV8DZrEtk9HmX61
	Pyka1eyeiVZPR0V3FoLeyVyqRthaZ/kZ9+cHEuudbCYuIaA/Qzh/J+i2hyGz4idD5G
	g8K0f2AdhTMzgeVJN9X5mSfumVa6GW5ehfTD6dpE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QJb891032389;
	Wed, 26 Sep 2018 14:37:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 26 Sep 2018 14:37:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 26 Sep 2018 14:37:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8QJb8HD019386;
	Wed, 26 Sep 2018 14:37:08 -0500
Date: Wed, 26 Sep 2018 15:35:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Tsai, Matt" <matt.tsai@thermofisher.com>
Message-ID: <20180926193521.GC5026@beryl>
References: <BN7PR07MB486664B157A30E27F0FAE23692160@BN7PR07MB4866.namprd07.prod.outlook.com>
	<CADrbpyyj=bONWiAS7sE0hFGM10p244oGsnWZP_WKSkxaqULM6Q@mail.gmail.com>
	<BN7PR07MB4866C5DD48412948FBD3E28E92150@BN7PR07MB4866.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN7PR07MB4866C5DD48412948FBD3E28E92150@BN7PR07MB4866.namprd07.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Poky and meta-ti advice for Beaglebone Black
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
X-List-Received-Date: Wed, 26 Sep 2018 19:37:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 26, 2018 at 06:27:10PM +0000, Tsai, Matt wrote:
> Leo,
> 
> Thanks for sharing the experience.
> Questions:
> 
>   1.  Do you set MACHINE ?= “am3335x-evm” in local.conf and build 
>   core-image-minimal? Or other image target is used?

Don't use core-image-minimal - it won't install modules or DTBs into rootfs 
automatically. You'd have to install those manually. Or use at least 
core-image-base or some custom image.


>   2.  Do you have to modify anything to make Linux OS (not bootloader) 
>   Ethernet and USB to work?

Shouldn't need to.


> I used poky tag “sumo-19.0.0” and meta-ti tag “ti2018.02” and set MACHINE ?= 
> “beaglebone” to build core-image-minimal.

Please use matching branches - i.e. "rocko" from all branches.
There were recent reports that "beaglebone" machine had some boot issues. 
Use "am335x-evm" instead - it does support Beaglebone.


> The USB host does not work. I  wonder if I am using a good base to start 
> with.

Check if you have corresponding modules installed and loaded.


> Also, a question about the Linux kernel 
> meta-ti/recipes-kernel/linux/linux-ti-staging-4.14/defconfig content:
> The original in “ti2018.02” tag is “use-tisdk-config= ti_sdk_omap2_release”. 
> But I also see people changing it to “use-tisdk-config= 
> ti_sdk_am3x_release”. I tried both, but USB host working. So I wonder what 
> is the correct one to use?

The defconfig is being selected based on the machine you build for. When 
building "am335x-evm" or "beaglebone", the defconfig with ti_sdk_am3x_release 
is used.


> Thank you for your help!
> 
> 
> From: Leo Meza [mailto:leo.e.meza@gmail.com]
> Sent: Wednesday, September 26, 2018 6:28 AM
> To: Tsai, Matt <matt.tsai@thermofisher.com>
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Poky and meta-ti advice for Beaglebone Black
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> Matt,
> 
> I've been having some success with the "rocko" branches (meta-ti, etc), and using the "am335x-evm" machine for beaglebone black.
> 
> I haven't done any i2c yet, but Ethernet and USB are working fine. I'm still on the left of the learning curve though, maybe someone else on this thread has better advice.
> 
> -Leo
> 
> On Tue, Sep 25, 2018, 4:19 PM Tsai, Matt <matt.tsai@thermofisher.com<mailto:matt.tsai@thermofisher.com>> wrote:
> Hi all,
> 
> I am new to Yocto and was trying to use poky and meta-ti to customize Linux to run on Beaglebone Black. There are a couple of questions I encountered, hopefully I can get some advice here:
> 
>   1.  What is the recommended poky and meta-ti branch/tag to use?
>   2.  If we need to enable some common device support such as Ethernet, USB host port, I2C, …etc., what do we need to modify on these recommended poky and meta-ti software?
> 
> Thank you for your help!
> 
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/meta-ti<https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_listinfo_meta-2Dti&d=DwMFaQ&c=q6k2DsTcEGCcCb_WtVSz6hhIl8hvYssy7sH8ZwfbbKU&r=LfbDghM-XW_5RT-h77pAoNBiz4zBr-sjgQI-UHuV1XU&m=UuF_TrnC3fiw_PH3rBROKHlrXnfbfuQsyAh86iV9mU8&s=CNQxEhuNF6ot6MXd-CTbz-U3ZLFsc_vqgRx_lnW3HkM&e=>

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


