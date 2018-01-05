Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20590E00D5F; Fri,  5 Jan 2018 10:33:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C6B4E008FB
	for <meta-ti@yoctoproject.org>; Fri,  5 Jan 2018 10:33:25 -0800 (PST)
Received: by mail-it0-f68.google.com with SMTP id o130so5291068itg.0
	for <meta-ti@yoctoproject.org>; Fri, 05 Jan 2018 10:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cV+136G+4hli9KvfzkV2QHSYSs7kL5yTTYNOTpmuyGM=;
	b=elBmc2y904WzBdsuZY4OTc+Easn41WteZvzGEqPAbgjni4fGVBOgsEyHYhyYjghyTj
	PC9s8mizPqtCdnTukNm0gSnJu9BawIpC4X1ODQeU+dkJwh6YgmSOXUir+2RAMK+JFC3I
	H+HRhaPBacJcIP0wd9cxQHpx7lUNDHF5bol5dzGM3l408RFCS+s8yxJON7JIn8414BQ3
	fCtpvdVT5KbNohiVukXPd/0DdyzvPdavqwNgUb10OEm/GJZFuFyeaK7xTvj10C+GYyr2
	l9IGWq958jOdtcGSfgvF71i0a7+YBhdj9JpEiWJt6anhVRt9tmuHcY5ltaqgZacdUwaH
	uOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cV+136G+4hli9KvfzkV2QHSYSs7kL5yTTYNOTpmuyGM=;
	b=U7wXsXTAYdJD8LACk4qSEmm7gawO6T3UOyq600MpI7b+2/6NgWbRb//GTc0LPidBdL
	vvYDbMGmtp6BQKMrbHJlNHt5grWXsKTYuJy+HWuwJh1hg2aKr6f/t7neNEruFZWibu1h
	X7hS9pGhkx7RQtqkqIdHgp6oGaBxBLp8XZsdbKNkOKPPuZDJmXGlhf4Toc2ydCt2qnq/
	2lojT+QI8zY4L9DmJm2BnV4wwTDiV+R/RNMCaw4Ti8uePTvt7BGoAgJuNfkyemGhN12b
	yvLkfMgwtrXTbML1EpXERTeYiH34UwvgqiFvgmbZGuDnYAM45Y6Q5tBsZYtK+hc3dc7Q
	mWfA==
X-Gm-Message-State: AKGB3mIBD2m6CFL8lLWM0KPP12PdvQckvzxTDwDwZkRMxFofbzw+EdHX
	/iL5vRHC5HMgengJZFCmqS0=
X-Google-Smtp-Source: ACJfBot9cmRyy9B6OFl0IeCZL5QNql5D/lDA7Td1MdI6NGpsjit/EaP8Tq1swRlBUcPgauyLDEcacQ==
X-Received: by 10.36.139.196 with SMTP id g187mr4170223ite.65.1515177204550;
	Fri, 05 Jan 2018 10:33:24 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	j96sm4062188ioo.73.2018.01.05.10.33.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Jan 2018 10:33:23 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1515177203.665.44.camel@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, meta-ti@yoctoproject.org
Date: Fri, 05 Jan 2018 12:33:23 -0600
In-Reply-To: <1513663292-22396-3-git-send-email-denis@denix.org>
References: <1513663292-22396-1-git-send-email-denis@denix.org>
	<1513663292-22396-3-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Subject: Re: [rocko/master][PATCH 3/4] openmp-rtos: depend on doxygen-native for documentation
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
X-List-Received-Date: Fri, 05 Jan 2018 18:33:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-12-19 at 01:01 -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-ti/openmp-rtos/openmp-rtos_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-
> ti/openmp-rtos/openmp-rtos_git.bb
> index f5bf476..df082ea 100644
> --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -19,7 +19,7 @@ SRCREV = "a2a518dcc9154a372b38bd5be8a483359123823c"
>  
>  LIC_FILES_CHKSUM =
> "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7
> c056195d7ebafee"
>  
> -DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-
> cgt6x-native libulm zip-native"
> +DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools ti-
> ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
>  DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
>  DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
>  DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
> -- 
> 2.7.4
> 
Can we backport this to morty please?

