Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05965E00CD9; Fri,  6 Jul 2018 11:41:14 -0700 (PDT)
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
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E98CE007D2
	for <meta-ti@yoctoproject.org>; Fri,  6 Jul 2018 11:41:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w66IfCWD112315;
	Fri, 6 Jul 2018 13:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530902472;
	bh=6q1P6xvirjrluW4N9VE52gc8j+ERVdPft1BwHLClwU4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IRi1A61KVEdbAjtmdnyJsrohbNzVU+dlZYqwmG/3WbLun7gMgmtXYRSZzFZ3idRrZ
	CXCJGq0puMzR6JuxtHO8nqRpEyt6/Q1dTKhtSGSiqevVRFx/aXGUmWKD014bztoldS
	Qdebh8uMoaVY7j1Bor07jnP/aFU0270+IMBSZNNs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w66IfCTk016480;
	Fri, 6 Jul 2018 13:41:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 6 Jul 2018 13:41:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 6 Jul 2018 13:41:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w66IfBOk008752;
	Fri, 6 Jul 2018 13:41:11 -0500
Date: Fri, 6 Jul 2018 14:40:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20180706184025.GM5464@beryl>
References: <20180706182044.GA10602@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20180706182044.GA10602@linux-uys3>
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
X-List-Received-Date: Fri, 06 Jul 2018 18:41:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 06, 2018 at 02:20:44PM -0400, Trevor Woerner wrote:
> Hi,
> 
> Has anyone else been seeing this?

Yes. This is due to gcc-8 being PITA. I haven't had time to fix it yet - need 
to keep compatibility with older gcc too...


> 	Build Configuration:
> 	BB_VERSION           = "1.39.0"
> 	BUILD_SYS            = "x86_64-linux"
> 	NATIVELSBSTRING      = "opensuseleap-15.0"
> 	TARGET_SYS           = "arm-oe-linux-gnueabi"
> 	MACHINE              = "beaglebone"
> 	DISTRO               = "nodistro"
> 	DISTRO_VERSION       = "nodistro.0"
> 	TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> 	TARGET_FPU           = "hard"
> 	meta-ti              = "master:63a2ec1c7f4ef0a2c355b3bc0ea1506ae3bc8534"
> 	meta                 = "master:416a8c241aff0dca6b8b123e52cf8e2d40c74c8d"
> 
> 	Initialising tasks: 100% |##################################################################################################################| Time: 0:00:02
> 	NOTE: Executing SetScene Tasks
> 	NOTE: Executing RunQueue Tasks
> 	ERROR: amx3-cm3-1.9.2-r0 do_compile: Function failed: do_compile (log file is located at /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045)
> 	ERROR: Logfile of failure stored in: /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045
> 	Log data follows:
> 	| DEBUG: Executing shell function do_compile
> 	|      CC       src/pm_services/dpll_43xx.o
> 	| cc1: error: -mfloat-abi=hard: selected processor lacks an FPU
> 	| make: *** [Makefile:51: src/pm_services/dpll_43xx.o] Error 1
> 	| WARNING: /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/run.do_compile.21045:1 exit 2 from 'make CROSS_COMPILE="arm-oe-linux-gnueabi-" CC="arm-oe-linux-gnueabi-gcc  --sysroot=/z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/recipe-sysroot  -mfloat-abi=hard"'
> 	| ERROR: Function failed: do_compile (log file is located at /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045)
> 	ERROR: Task (/opt/oe/configs/z/build-master/bbb/layers/meta-ti/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb:do_compile) failed with exit code '1'
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

