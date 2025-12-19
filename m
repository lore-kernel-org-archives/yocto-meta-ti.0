Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5015BE66882
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 17:31:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22087.1766165502762063682
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 09:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y1GrzMGp;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso881536f8f.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 09:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766165501; x=1766770301; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwbsqaQOIWWBVAs3YWWxbfyxd/9p+Jtf6aRC0sxj7CI=;
        b=y1GrzMGp8xiK8DSIFuK/faBGWBiJuyEoftnvnfVpYQ83pS8EuT4RjIyOn2EiVy80kh
         wq+vqdL3Gck79HCKTykaKZ4UC2+S3aptpKUFxLy/OTdG+5bRXshAXJ+EM3axeeFfdt5k
         QxeHExcbF7/LazlncAQ7Hc0SWxKOwl1oeSbTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165501; x=1766770301;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwbsqaQOIWWBVAs3YWWxbfyxd/9p+Jtf6aRC0sxj7CI=;
        b=RoD5/4/JiDLRpTO82gQs8nRZXAFKTLF6jPZNuUXLwReocHcE4P+Z+IjUhUOV9zHp1u
         w27VsimFPyC36xB2ViYlt9Zx4ZxWccDysd0mT201kDnpasNP13UYkWS0AhjzqWtfHdye
         YECjB/tdkT7xuShH+BEp0Q3J+z7Jtg2/Q9o2eLiIfuu6QYMzEdi0EZEK54/yEekqbwrw
         305nzMyh6ZREKo0FSXqFD96Q5icRVhda7sqOaOYBgmrtqDX5jPuuUF4rel6XtX9M+kjc
         gVsbM2QL5pJq7anPHn5hSIzFs2TA/01GnSn/Lhcczv6wcE4xm05GSn8OFyTyELK4mTcl
         UMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJp6AeaHM9E/atQwOCdAjh9Heug4ophpnKHPpJaFd5TXtdLFiBRq6OwAYZF4w9MkG5TGGMYZBL@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzkf1aUeBvf6h8VHieBhWXh5aV6B/37wWkbwFL5zT2GbcmA+GBt
	JeerjkFzbYn0Jvr28x9AwILTgbF0/5pibSwa+xpBv7bmYBtIlxYk7NH4UxeE1N092kc=
X-Gm-Gg: AY/fxX4V6J4I35ZKZ96Y72Hxt0vNyeyIpRNl6K8HQK/4jECOHcvqGxTy2f2yb1C8YQV
	NsTY0Y4c3fQ9x8TepVf1aZM0mI3OWG02xILn0wgD4NqyAGEZPlqViGQ9fEiuB0V6jQVvApcQpM1
	CH0djhM44Q8UESEFT+FO4XxRqIqpcLH04UCfSeMQ/5ZGs1YwSFJDoT7xnq/9v4hrmGrHVmbZpha
	68Ro6uh6I8uP1njSt3O5Bhc/Dmd6n9ATXAlV/vzYDBK8NxssTNepyZ7EnH8umFZWLSOlAIegbSl
	2ViBVYpdDwYMF+eMa+Fng5gbSpLs0iGcpg3G1nCPisu+Icv3sW26vyhCdDeDLNw63VFdDP4aAXg
	6IljfeHHTrlseT7+bIuOfP29F27yf5w2BpSYu1tObvaauATEyaND9/VOcblsGHUb+HkwJaNbx0g
	sl34Jp0Ux9HRzwj8Le8i9mWLNkblyYJHsyrStc0Yd+6rgviJ7YLT32mFal7hKY+gNRLhvG1kew3
	XiLBg9tm/WPmSj1d1pAaTuUwigMlFq4OzlaI03xvo2fDNjhKwa2FQ==
X-Google-Smtp-Source: AGHT+IG7dNB4vlIsZKeSefB+BLv1L2ff9bJiEamRy4LF5dtHrrQXcXwAVOJ5c2bbBFsx3nmyf2FJIQ==
X-Received: by 2002:a5d:5d86:0:b0:431:fc:694a with SMTP id ffacd0b85a97d-4324e4c71bbmr4661025f8f.12.1766165501160;
        Fri, 19 Dec 2025 09:31:41 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a? (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr. [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea226d1sm6514009f8f.13.2025.12.19.09.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 09:31:40 -0800 (PST)
Message-ID: <cdc9c53a-4299-41b6-8da7-a65577dc11c2@smile.fr>
Date: Fri, 19 Dec 2025 18:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/4] linux-ti-staging: Add
 v6.12 recipe
To: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
 Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
References: <20241004151857.24578-1-reatmon@ti.com>
From: Romain Naour <romain.naour@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <20241004151857.24578-1-reatmon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 17:31:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19378

Hello,

Le 04/10/2024 à 17:18, Ryan Eatmon via lists.yoctoproject.org a écrit :
> Adding needed recipes for initial testing and development of the 6.12
> kernel for the next LTS.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
...
>  .../linux/linux-ti-staging-rt_6.12.bb         |  9 +++++
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
...
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
> new file mode 100644
> index 00000000..9e5c4ee4
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
> @@ -0,0 +1,9 @@
> +require linux-ti-staging_6.12.bb
> +
> +KERNEL_LOCALVERSION:append = "-rt"
> +
> +# Look in the generic major.minor directory for files
> +# This will have priority over generic non-rt path
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"

Previous linux-ti-staging-rt recipes [1] used a specific branch
"ti-rt-linux-6.1.y" obtained by merging the TI vendor "ti-linux-6.1.y" branch
and the preempt-rt v6.1-rt branch [2].

  BRANCH = "ti-rt-linux-6.1.y"

Since preempt-rt is now merged in the kernel 6.12, indeed we can use the same
kernel sources with a specific configuration fragment (hence there is no
ti-rt-linux-6.12.y [3]).

But the preempt-rt project still maintain a v6.12-rt branch with all remaining
patches [4]. Actually the project still recommend to apply the latest PREEMPT_RT
patches [5].

Should the linux-ti-staging-rt recipe follow the preempt-rt stable branch as before?

Porting existing project (kirkstone 6.1 -> scarthgap 6.12) using
linux-ti-staging-rt recipe, users may expect that this recipe still use the
preempt-rt stable branch.

Thoughts?

[1]
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb?h=kirkstone#n9
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/log/?h=v6.1-rt
[3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[4]
https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/log/?h=v6.12-rt
[5] https://realtime-linux.org/getting-started-with-preempt_rt-guide/

Best regards,
Romain


> +
> +include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}

