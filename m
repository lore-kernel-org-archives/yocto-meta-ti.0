Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7931E00D73; Thu,  9 May 2019 14:12:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB34EE00D6B
	for <meta-ti@yoctoproject.org>; Thu,  9 May 2019 14:12:31 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x49LCUWf048184;
	Thu, 9 May 2019 16:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557436350;
	bh=ZFWbuFr89MVCITshSBHF46S3w6QLwga6WJe2+p7xOUo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pMuEHxAwqiF5cdQwGXCSMbP79ZSSiYa+OxFyjxZ4ia2s7304HIV6T1DjnUuG4QkQD
	7wn2JmiNa3g7ZVGABNxntnNKfZm0qKF/CDc33BE0JWSKBnJkmsXlPrejACu25uHfVW
	7s0LjoQNRWGraZ1BaJVy5XpIoMklqND/KEdF3aLk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x49LCUFZ105275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 May 2019 16:12:30 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 9 May 2019 16:12:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 9 May 2019 16:12:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x49LCTXS055909;
	Thu, 9 May 2019 16:12:29 -0500
Date: Thu, 9 May 2019 17:12:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Andreas Hansson <pahansson73@gmail.com>
Message-ID: <20190509211229.GF5359@beryl>
References: <CABtUruFr4cKiujy=d+y-v-0zqXyzDeKX67QObQEzNU33VSW8yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABtUruFr4cKiujy=d+y-v-0zqXyzDeKX67QObQEzNU33VSW8yg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud] ti-sgx-ddk-km do not build in thud
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
X-List-Received-Date: Thu, 09 May 2019 21:12:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Andreas,

Can you please check if this fixes your issue:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=thud&id=5e62bde3d2f2858a39a75d6408433873dcacd6f8
http://git.ti.com/gitweb/?p=graphics/omap5-sgx-ddk-linux.git;a=commitdiff;h=dbdbd9309a58ee723fc827ef5fd45c28347cf61f

-- 
Denys


On Mon, Apr 15, 2019 at 11:25:44AM +0200, Andreas Hansson wrote:
> Hi
> 
> when compiling the recipe ti-sgx-ddk-km with using the thud branch in
> meta-ti(and poky) I get this error:
> 
>  ../config/compiler.mk:176:
> ******************************************************
> | ../config/compiler.mk:176: Compiler target 'arm-poky-linux-gnueabi' not
> recognised
> | ../config/compiler.mk:176: (missing ../config/compilers/
> arm-poky-linux-gnueabi.mk file)
> | ../config/compiler.mk:176:
> ******************************************************
> | ../config/compiler.mk:176: *** Compiler 'arm-poky-linux-gnueabi' not
> recognised.  Stop.
> 
> If I examine the source of ti-sgx-ddk-km I can see that there are a number
> of makefiles in the .../config/compilers/ directory, apparently one for
> each compiler name, but none for arm-poky-linux-gnueabi.
> 
> This is the content
> 
> .../eurasia_km/eurasiacon/build/linux2/config/compilers# ls -la
> total 28
> drwxr-xr-x 2 1000 1000 4096 Apr 15 08:33 .
> drwxr-xr-x 3 1000 1000 4096 Apr 15 08:33 ..
> -rw-r--r-- 1 1000 1000  316 Apr 15 08:33 aarch64-linux-gnu.mk
> -rw-r--r-- 1 1000 1000  144 Apr 15 08:33 arm-linux-gnueabihf.mk
> -rw-r--r-- 1 1000 1000   59 Apr 15 08:33 i386-linux-gnu.mk
> -rw-r--r-- 1 1000 1000   71 Apr 15 08:33 mips-mti-linux-gnu.mk
> -rw-r--r-- 1 1000 1000 1237 Apr 15 08:33 x86_64-linux-gnu.mk
> 
> 
> If I copy the file arm-linux-gnueabihf.mk to arm-poky-linux-gnueabi.mk
> everything compiles fine.
> 
> I have tried this in meta-ti
> version: 51ea3a467a688b51f2e033657c77aa55f4452ed3
> 
> Build Configuration:
> BB_VERSION           = "1.40.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-poky-linux-gnueabi"
> MACHINE              = "beaglebone"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.6.2"
> TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
> meta-ti              = "HEAD:51ea3a467a688b51f2e033657c77aa55f4452ed3"
> meta
> meta-poky            = "HEAD:a192fff25b10fc29543edaef8555f3b15ef8234f"
> ...
> 
> 
> 
> BR
> Andreas Hansson

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


