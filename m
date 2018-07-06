Return-Path: <twoerner@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA3BFE010A2; Fri,  6 Jul 2018 11:20:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (twoerner[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 330ADE00AD8
	for <meta-ti@yoctoproject.org>; Fri,  6 Jul 2018 11:20:49 -0700 (PDT)
Received: by mail-it0-f47.google.com with SMTP id p4-v6so17666562itf.2
	for <meta-ti@yoctoproject.org>; Fri, 06 Jul 2018 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=b8lMcZvCFOU52/Z/Negys+wNItt6Sud6NyFY9coHmZU=;
	b=jSKfujAhS6HFdC7SPRE0mzdANOEx98W1FlPFXahAo9oZ/7qjZHtBN6tMvGlX2L97bo
	7EUUDZ1bB6chAbjyjjp28qmJZS2EmVAisZqfBwc16iLian8V6nzXRzew4KUX/v/QAOF0
	St8q5YpzhQwAjreXNRbNm3fyYTOpyS7bYy8uwPjD8D085TV4YX2IgU4NxTdDIdpSFx5l
	i0BEBN7VQhiVffstBcraHL0mTgy8bi9cSY2ULan+53cPUzL2tb2I2b6BLhtNNpnYGxGZ
	jRek7rL4MnJVl2A36qtfKa94lE7E5DCp2E0yb+en2h6P1MghJbjeX2dEkXvAju0vK3j9
	/5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=b8lMcZvCFOU52/Z/Negys+wNItt6Sud6NyFY9coHmZU=;
	b=tJ3rcjUE5MljKHbygsd79cUhB2RJjBU6UxX0gm0vY01kk1i2KnzJVxt5JltMSY/9sW
	S/0xgObeVg87XCdgGm5RvmT5BTGV/vN0nxmMKEotZC+c2l8EDPVKDqTmxEf/CdrLOgyB
	GznYpllxBPZTQ1RrkCna8P/Ni9lkzljuVachgqGjOTwX8SBoFjgJ7YRm/6rJHF+uzxpe
	aNdLftCaHM3Wrz1rv0HxYRwbVcJ4B+9qbiQj83Z0zUiKBOB2jYPE7qCJD5syvZsnj+eB
	q/waLtPOdSCuKR0QtQsTDHNuX2na4a1no+taAlt+1Q6PdSb80kxkcYEE9f7Ny/pU+wzh
	phRw==
X-Gm-Message-State: APt69E2IKfnUNbkDv0GVYP4bYbyFdt1uLWGwIRWabG/j1n/2gxepBmr/
	qp3Rk+PjCP7rPlVmR4eaQf0XlM70
X-Google-Smtp-Source: AAOMgpd+7bw28rg/AArZDHjtm0hd4KVP92UbfChMOS29+6Jt95NSil36ECp+06E4RdN0mnOYaLbI5Q==
X-Received: by 2002:a24:3243:: with SMTP id
	j64-v6mr9006789ita.23.1530901248458; 
	Fri, 06 Jul 2018 11:20:48 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	k206-v6sm3296334ite.34.2018.07.06.11.20.46
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 11:20:47 -0700 (PDT)
Date: Fri, 6 Jul 2018 14:20:44 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: meta-ti@yoctoproject.org
Message-ID: <20180706182044.GA10602@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: amx3-cm3 build failure on master
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
X-List-Received-Date: Fri, 06 Jul 2018 18:20:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Has anyone else been seeing this?

	Build Configuration:
	BB_VERSION           = "1.39.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "opensuseleap-15.0"
	TARGET_SYS           = "arm-oe-linux-gnueabi"
	MACHINE              = "beaglebone"
	DISTRO               = "nodistro"
	DISTRO_VERSION       = "nodistro.0"
	TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
	TARGET_FPU           = "hard"
	meta-ti              = "master:63a2ec1c7f4ef0a2c355b3bc0ea1506ae3bc8534"
	meta                 = "master:416a8c241aff0dca6b8b123e52cf8e2d40c74c8d"

	Initialising tasks: 100% |##################################################################################################################| Time: 0:00:02
	NOTE: Executing SetScene Tasks
	NOTE: Executing RunQueue Tasks
	ERROR: amx3-cm3-1.9.2-r0 do_compile: Function failed: do_compile (log file is located at /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045)
	ERROR: Logfile of failure stored in: /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045
	Log data follows:
	| DEBUG: Executing shell function do_compile
	|      CC       src/pm_services/dpll_43xx.o
	| cc1: error: -mfloat-abi=hard: selected processor lacks an FPU
	| make: *** [Makefile:51: src/pm_services/dpll_43xx.o] Error 1
	| WARNING: /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/run.do_compile.21045:1 exit 2 from 'make CROSS_COMPILE="arm-oe-linux-gnueabi-" CC="arm-oe-linux-gnueabi-gcc  --sysroot=/z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/recipe-sysroot  -mfloat-abi=hard"'
	| ERROR: Function failed: do_compile (log file is located at /z/build-master/bbb/build/tmp-glibc/work/armv7at2hf-neon-oe-linux-gnueabi/amx3-cm3/1.9.2-r0/temp/log.do_compile.21045)
	ERROR: Task (/opt/oe/configs/z/build-master/bbb/layers/meta-ti/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb:do_compile) failed with exit code '1'


