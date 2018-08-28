Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97BD8E00848; Tue, 28 Aug 2018 13:56:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7750CE00519
	for <meta-ti@yoctoproject.org>; Tue, 28 Aug 2018 13:56:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SKuL0x012229;
	Tue, 28 Aug 2018 15:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535489781;
	bh=SUm644QDSat8Z/cYFtUiuz7d/5AGDL3W00G6H1CcnAw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PEymoPrNVb1Mq4QkMnyUZ7Cm3rzMABTB3jCII3LC97G5WKfWpZ7CCnuluCCJ0Y0pu
	YsH42C2tes+z18mOm19hK1LpZNHv+cR66KjYj2AEF1YSiudMTQRG5eoxr8m0g1BmLh
	+fwm834wVJf9XVq7pZtLT1YrG8e4scg+pOs98WfE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SKuLMQ011081;
	Tue, 28 Aug 2018 15:56:21 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 15:56:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 15:56:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SKuKmm009608;
	Tue, 28 Aug 2018 15:56:20 -0500
Date: Tue, 28 Aug 2018 16:55:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20180828205531.GC11110@beryl>
References: <20180706182044.GA10602@linux-uys3> <20180706184025.GM5464@beryl>
MIME-Version: 1.0
In-Reply-To: <20180706184025.GM5464@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: amx3-cm3 build failure on master
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
X-List-Received-Date: Tue, 28 Aug 2018 20:56:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 06, 2018 at 02:40:25PM -0400, Denys Dmytriyenko wrote:
> On Fri, Jul 06, 2018 at 02:20:44PM -0400, Trevor Woerner wrote:
> > Hi,
> > 
> > Has anyone else been seeing this?
> 
> Yes. This is due to gcc-8 being PITA. I haven't had time to fix it yet - need 
> to keep compatibility with older gcc too...

BTW, this is still an issue and the suggested workaround remains to use gcc-7 
for now by setting below in distro config or local.conf:

GCCVERSION = "7.%"


> > 	Build Configuration:
> > 	BB_VERSION           = "1.39.0"
> > 	BUILD_SYS            = "x86_64-linux"
> > 	NATIVELSBSTRING      = "opensuseleap-15.0"
> > 	TARGET_SYS           = "arm-oe-linux-gnueabi"
> > 	MACHINE              = "beaglebone"
> > 	DISTRO               = "nodistro"
> > 	DISTRO_VERSION       = "nodistro.0"
> > 	TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> > 	TARGET_FPU           = "hard"
> > 	meta-ti              = "master:63a2ec1c7f4ef0a2c355b3bc0ea1506ae3bc8534"
> > 	meta                 = "master:416a8c241aff0dca6b8b123e52cf8e2d40c74c8d"
> > 
> > 	Initialising tasks: 100% |##################################################################################################################| Time: 0:00:02
> > 	NOTE: Executing SetScene Tasks
> > 	NOTE: Executing RunQueue Tasks
> > 	ERROR: amx3-cm3-1.9.2-r0 do_compile: Function failed: do_compile (log file is located at /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045)
> > 	ERROR: Logfile of failure stored in: /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045
> > 	Log data follows:
> > 	| DEBUG: Executing shell function do_compile
> > 	|      CC       src/pm_services/dpll_43xx.o
> > 	| cc1: error: -mfloat-abi=hard: selected processor lacks an FPU
> > 	| make: *** [Makefile:51: src/pm_services/dpll_43xx.o] Error 1
> > 	| WARNING: /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/run.do_compile.21045:1 exit 2 from 'make CROSS_COMPILE="arm-oe-linux-gnueabi-" CC="arm-oe-linux-gnueabi-gcc  --sysroot=/z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/recipe-sysroot  -mfloat-abi=hard"'
> > 	| ERROR: Function failed: do_compile (log file is located at /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045)
> > 	ERROR: Task (/opt/oe/configs/z/build-master/bbb/layers/meta-ti/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb:do_compile) failed with exit code '1'
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

