Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D859ECCFA13
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 02:59:36 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3273.1762484368344880198
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 18:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P2azxDgO;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3c972dec6easo195483fac.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 06 Nov 2025 18:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762484367; x=1763089167; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFj6EOAXqhLivb/UZR5YVYhn4jNmaf8FG9QFWfZ9vRM=;
        b=P2azxDgOdZDQLHnHwFpQpZRlrppnINLvE8qS/AIf0CUDeagBfMa9bhVKi5l0oIPE+q
         zkZO1QseWexUHJPaDulIoIr94QnGRpVgFPN6nVCE/BWi8LOLcp94KyYpf2jAwfqahRdH
         vCx2iIGFYCwZY1Wj3WSqY8RS0dT9XQvEadddSHgD4CLGBy8NGycf2Nd5MW/H31HH5X5s
         /zMBzHc69ASJA11PCVgl4ITV2rE8Lb5ZC9sSl177RGMM3N8orMkAqAH2/UPBx6045LNu
         iS3VNFRY4pa5QVk6XvtxrFIzEPriBwnOpHwja5mPb3TJERaRw1u/G83G0F9J9GQbC1JT
         bMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762484367; x=1763089167;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFj6EOAXqhLivb/UZR5YVYhn4jNmaf8FG9QFWfZ9vRM=;
        b=HUHLZOlZEZjq67sUFQ7YU+9U0ADNvoA++rGCx72sJoTMAdzwjcuVXRB2FpbTS7cy1b
         dqioj623WsPpeILyYaGF+9POiAVFiOhrl5+n77tDxswv/l11r6lXBIWoIUyIGdPgbtaK
         qHunU4TEIhm7yXToy5FbJlGkYaBCm9DCLJtBzWoMooON+seEJSmN3AhhiDpbOkRC4XUP
         Ww/djupZ0/H7zmgzMx6IIh0htFOD9oBpO6OAKgBdJEjz4F8GgugJaJAt3r9Q8W04t9/O
         hfOhbGzeBGmiZ/WgIrGVQ5qXwFN0V5U0LAyvGmQMYRcBJGgrGgas8d9A741mvXwOhaqK
         6fsg==
X-Forwarded-Encrypted: i=1; AJvYcCUA8XWW7Xx6IQhPGEMKzA5kCldfX0idRL3GU2Y5AGBDHiHQFvlf0cLD8w1EpLYoBAnsIRDNMn9z@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz5FP2EPC5tLmNEQDvOV47kR8wLk6KXSi9+g5acrqV2aEE3T7Y1
	kzJhaCuR7jlX7iV2m/9+FLE0wDl/gNogG1LxCPrJK551j/+fqcpcZLi6
X-Gm-Gg: ASbGncvGx94Q86giAGTMKBrbXdEGwKOjwde/ZnXQMHbK3CUkd5ML0EscfUcEnICYF0M
	vmLP3SnvfT6rhdnpbyjO5IcjabQsSNjhBkX0/6JPap8Zl4YmiucK1gtcx86krs7AU4NKpU2uerr
	VXug/YJ+9xpvCOZ92YTpCFl0RnPpvCoYrSAxwlr+0rrUbe1cSaj8pUaMwF3A37r9o/l4NL8vxnQ
	rYSmKeEjgs2eEZF39Ok1nAYAKKD+T00D93kiCn2/D8EUkK0o8+gx+6GHcFn6Ds21dWPdpHGFDmY
	ei1J9g/7GjDQJ2JzrgvdTLvSQliMBs5ooVtLgpNJ64HyEKulhbU6bX3l1QydVMrUpoBZ7Sj+YUX
	7780Ty0vmDCeBz+tGJiISFGGvJTZqIEIUve7xkARXIDdcDottwqX3tKgVDZdW1YBx0WvQKN4=
X-Google-Smtp-Source: AGHT+IGmIeKAZhI4VQ1xMFINCwSVrLcjwx847ErusS5IRIwiNYcRWulcW9a6ce4dBUOJwtj7qTbkJA==
X-Received: by 2002:a05:6870:d60d:b0:3e3:48b7:340e with SMTP id 586e51a60fabf-3e41e530d01mr1246611fac.12.1762484367551;
        Thu, 06 Nov 2025 18:59:27 -0800 (PST)
Received: from localhost ([99.150.150.17])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e41e7f96a4sm890842fac.0.2025.11.06.18.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 18:59:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Nov 2025 20:59:26 -0600
Message-Id: <DE24KCGE6W2I.2SEIT58IEUNC9@gmail.com>
Cc: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap/master][PATCH] layer: add github MIRRORS
 definitions
From: "Res Sapp" <res.sapp@gmail.com>
To: <denis@denix.org>, <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251107010115.1974047-2-rs@ti.com>
 <20251107012234.GQ3125@denix.org>
In-Reply-To: <20251107012234.GQ3125@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 02:59:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19236

On Thu Nov 6, 2025 at 7:22 PM CST, Denys Dmytriyenko via lists.yoctoproject=
.org wrote:
> I wonder how that will affect the signatures for the YP Compat... [Not ev=
en=20
> talking about evil github reliance...]
>
>
> On Thu, Nov 06, 2025 at 07:01:16PM -0600, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> We have some projects mirrored to GitHub currently. It makes sense to
>> add a MIRRORS entry for git.ti.com sources to fall back on in the event
>> git.ti.com is unreachable.
>>=20
>> Placing this in the main BSP layer configuration file should be all that
>> is required for this and any other layers that depend this core layer to
>> fall back to GitHub.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>=20
>> Tested locally by making git.ti.com ns lookups return NXDOMAIN and then
>> requesting to fetch linux-ti-staging.
>>=20
>>  meta-ti-bsp/conf/layer.conf | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index e3a28628..d87d040b 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -36,3 +36,8 @@ TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
>>  DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images/${MACHINE}"
>>  SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
>>  PSEUDO_IGNORE_PATHS:append:ti-soc =3D ",${TI_COMMON_DEPLOY}"
>> +
>> +MIRRORS +=3D " \
>> +    git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;prot=
ocol=3Dhttps \
>> +    gitsm://git.ti.com/.* gitsm://github.com/TexasInstruments/BASENAME;=
protocol=3Dhttps \
>> +"
>> --=20
>> 2.51.1

I hate M$ as much as anyone else, but reliable infrastructure as a *fallbac=
k* is
still useful. As far as signatures go, you guys have been doing this in
meta-arago with the arago distro since 2019.

- Randolph

