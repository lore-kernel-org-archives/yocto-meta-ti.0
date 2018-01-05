Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9906BE00D5F; Fri,  5 Jan 2018 10:33:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (jpewhacker[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29049E008FB
	for <meta-ti@yoctoproject.org>; Fri,  5 Jan 2018 10:33:43 -0800 (PST)
Received: by mail-it0-f68.google.com with SMTP id r6so2638225itr.3
	for <meta-ti@yoctoproject.org>; Fri, 05 Jan 2018 10:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=imgzTxgnepTtBBe5eB87CJgbPsruHDT03JEGWYPMSTA=;
	b=neius0ghEXVm9vFuih5X+UEDZRbj7dksqAorwPGx8/fd5D41b/3hRPP1zxTOEI+qj0
	jsqXCut487VZM/sRSUPPqMp9YfvYL6nkw7IG4SaYmWLNz1oYTER+s6iMyxx3Pw4r/p2W
	GdpZMlKrauaRWceYii/7O1OqnwLRzjpRH9xTsYZHriVAEsAR6KwHZY862hWaXqmi2D3D
	hW64jS09WtVq38ZpL+aQZQEDHpfctbI/1QgW2Hc0dW+ZBYMMBA/EY1H7VV7foVPF8vPe
	DdsWfHP2Xgydq/9Y7DIwAJAOY15irB0WuExhH9DFcVkwNviK97IUYj0q8uAvegPKO1XL
	V0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=imgzTxgnepTtBBe5eB87CJgbPsruHDT03JEGWYPMSTA=;
	b=ajv+HD1tyj1fWUW1xpC53mRsCJG9ERBYRyS1W1OP+wkz5ONNddKVb2K0mhj5yqLsH1
	NVQfaZWybtAyQYOcVZLDLS+/8DW++uZC2LcjHCors7GaelI/HkyWVUrXpCKfsld2Mzrs
	DOTqW90cTW4WCYaI/YDL6q2kLLtUQm7imVfFTXj+eL3wH/ECWzNkGl0wRU9UPUKi3XS+
	6jaLuAXKe+Pyzfd1Mke+JgZnttpHKUUg4zLlJd7DAvP/Bs3BH5ylgdH7E5HpJhrUpkir
	NbS4dRkIC5oO5aNMr7TNqrk3HBp8z2M3UX20mwW3KWsi5DsEvYMZPVU3VpZoJhUFvU8Z
	fWZw==
X-Gm-Message-State: AKGB3mJGLnX6UnNmkv7FxHEHFN+JwYIXugkU2FeBbEBbq7pthZ63bJYa
	glReV/+2dj5WKpzmwvmHaD0=
X-Google-Smtp-Source: ACJfBovofJe+aQPBvgoX2TEb3e7KjiIiC+RjafAuMayR+wJoYILTez6gFny7aKoK5ZHwDOEmE3cEcQ==
X-Received: by 10.36.217.132 with SMTP id p126mr3789595itg.120.1515177222815; 
	Fri, 05 Jan 2018 10:33:42 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	z21sm3713329iob.41.2018.01.05.10.33.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Jan 2018 10:33:42 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1515177221.665.45.camel@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, meta-ti@yoctoproject.org
Date: Fri, 05 Jan 2018 12:33:41 -0600
In-Reply-To: <1513663292-22396-2-git-send-email-denis@denix.org>
References: <1513663292-22396-1-git-send-email-denis@denix.org>
	<1513663292-22396-2-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Subject: Re: [rocko/master][PATCH 2/4] ti-pdk.bbclass: depend on doxygen native for documentation
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
X-List-Received-Date: Fri, 05 Jan 2018 18:33:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-12-19 at 01:01 -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  classes/ti-pdk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index f876802..801c495 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -3,7 +3,7 @@ require recipes-ti/includes/ti-staging.inc
>  
>  inherit perlnative
>  
> -DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-
> rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-
> native ti-cgt-pru-native ti-pdk-build-rtos"
> +DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-
> rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-
> native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
>  
>  DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
>  DEPENDS_remove_ti33x = "ti-cgt6x-native"
> -- 
> 2.7.4
> 
Can we backport this to morty please?

