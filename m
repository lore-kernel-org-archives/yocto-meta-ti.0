Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB0E2E00DE4; Mon,  5 Feb 2018 20:09:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.65 listed in list.dnswl.org]
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66E8DE00DB5
	for <meta-ti@yoctoproject.org>; Mon,  5 Feb 2018 20:09:57 -0800 (PST)
Received: by mail-pl0-f65.google.com with SMTP id t4so499126plo.0
	for <meta-ti@yoctoproject.org>; Mon, 05 Feb 2018 20:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bKZowoMFkUCrHaKclvNsYartax6n1LLnK3GptsQyf1I=;
	b=Z3r3yVkcz7afMUjcucAgxmGujTK0ubWR/StePCJRKGqQIdpapkgFa11gK0CWcKqF4g
	t3LWGGvTVrBMFe+WNfMrBjBUmDO1n0lCsVJ2LXZa3lczPBq9lP9JGRIRMkGLAgnr/m+b
	oIwtbqyfQwvlov0VQ/n2AHYaPoA20wIKk8/8CIdWD5Weeu2QZL5KEZIJYowb7TbuNvMk
	ib9YjKUapUmFrexjMsz/IKianBUouoHrD4qf0Hv2hfRNQgRz7FfkhGVBMay3LKRzmrTF
	LtJi9LGm+kp+j26SCtHziBhPXkIYumcxTnALdmwyHJv79436yyAaXPbK6yxOh2KKDFZY
	hj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=bKZowoMFkUCrHaKclvNsYartax6n1LLnK3GptsQyf1I=;
	b=UiQhlgNPLDK4OYqgiaKyx7I2x9KBkvDayFlJ3W/6uVSPa6K6C5hlINZ7SqmoFzvKxs
	dpVxMEmkBMPpZ0T8UcjHFYoN5+J5LBFst+84OQ3It8HVkPZwGSseKwGs5HkbO9jmL1fN
	cKLNfekvJF3Myxok0t8KIINfSnyI7jyWS/f3UtWuKgMHtZKk2Fp4Fqi7GHpJaACflEvp
	akLgCZ82FFWUEogD/WLaygl7cVPOiNTSLXo36RvLLmoOvs1w14g2IId0UgE+R5L4duq8
	cAqsokJpRg6IBKUtWDsbGkQ8syIWwlqGhSmydD+gdiq4Bbw5Nbz3ZgcSyPLmnYpUkl/5
	x6NQ==
X-Gm-Message-State: APf1xPDEfUG6IzLhhfVAPJLyelGJmgkYy2I7KEI1PoIsPIwkaAMPKmMj
	nWKyCtQStjtRLi+a98tUMGPHgsX3
X-Google-Smtp-Source: AH8x225gMDJFNiJRVgarvc+NpGlpSUJHYwSqPZhuZvgVIsl08iiyJ6lJ6YDYHip0iCfo2lUBGhd6mg==
X-Received: by 2002:a17:902:6b0b:: with SMTP id
	o11-v6mr1070610plk.109.1517890196238; 
	Mon, 05 Feb 2018 20:09:56 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:1cb8:99a9:4642:6fca])
	by smtp.gmail.com with ESMTPSA id
	c184sm18634183pfc.60.2018.02.05.20.09.55
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 20:09:55 -0800 (PST)
To: meta-ti@yoctoproject.org
References: <1517881415-17786-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <63b34f6e-ba51-3721-03ee-6c8fb224fd12@gmail.com>
Date: Mon, 5 Feb 2018 20:09:54 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1517881415-17786-1-git-send-email-denis@denix.org>
Subject: Re: [master][PATCH] beaglebone: drop check for meta-yocto-bsp collision
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
X-List-Received-Date: Tue, 06 Feb 2018 04:09:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/5/18 5:43 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Now that meta-yocto-bsp renamed reference machine to beaglebone-yocto

thats a good move finally.

> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   conf/machine/beaglebone.conf        |  1 -
>   conf/machine/include/beaglebone.inc | 12 ------------
>   2 files changed, 13 deletions(-)
>   delete mode 100644 conf/machine/include/beaglebone.inc
> 
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 715d2f2..a73bf22 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -3,7 +3,6 @@
>   #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
>   
>   require conf/machine/include/ti33x.inc
> -require conf/machine/include/beaglebone.inc
>   
>   KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
>   
> diff --git a/conf/machine/include/beaglebone.inc b/conf/machine/include/beaglebone.inc
> deleted file mode 100644
> index b10146d..0000000
> --- a/conf/machine/include/beaglebone.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -python () {
> -    layers = d.getVar("BBFILE_COLLECTIONS", True)
> -    if not layers:
> -        return
> -    if "yoctobsp" in layers:
> -        bb.fatal("\nmeta-yocto-bsp has been detected in bblayers.conf, which provides basic reference BSP for beaglebone platform. " \
> -                "\nSince meta-ti provides official comprehensive BSP for TI SoCs, including beaglebone, there could be potential conflicts " \
> -                "\nbetween beaglebone machine definitions available in meta-yocto-bsp and meta-ti layers. It is recommended to remove " \
> -                "\nor disable meta-yocto-bsp in bblayers.conf, when using meta-ti and building for beaglebone platform. Alternatively, " \
> -                "\nit is possible to build for am335x-evm with meta-ti, which is a more generic platform for Sitara AM335x SoC and " \
> -                "\nalso covers beaglebone variants.")
> -}
> 

