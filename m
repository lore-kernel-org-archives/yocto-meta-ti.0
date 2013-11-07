Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A584AE017FA
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 20:56:26 -0800 (PST)
Received: by mail-ie0-f174.google.com with SMTP id qd12so57894ieb.19
	for <meta-ti@yoctoproject.org>; Wed, 06 Nov 2013 20:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bBfDwsUADBf/GksWAk5mVZJphUpinh+MOidQFpDTLDk=;
	b=dpvts6AeLeA7ZM9FRXjVbBTAI+PpjmouoYrcbS4+F61SHyX2OMPo9nw9vfUXqcElUW
	VGdofbnMx+ce3GHFDh5Z/efYza5H3l/lFfSZ9xOSOfZ2/Pe5Tmlm0CHwuBR9kPhywHZh
	0iVvZ6LCiUQMVavom+ylrgRrQtq0WNXTCSvjdge9PT2bhCiQ1FizsUvJYGYvVVGJ7DSC
	QcUoMGf5IStlE/hYe90VZFbiY2haLjeJvYDUAscT0v0EdlvsxqqDQNCBESrageNfbqKr
	FHRij98gKXEjecheCLEvjLRjBck0tcAd9ErNykBq6faik0rlrBIKlJK/KVmZ2ow/DQdB
	kCmQ==
X-Received: by 10.50.26.36 with SMTP id i4mr683135igg.33.1383800185360; Wed,
	06 Nov 2013 20:56:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Wed, 6 Nov 2013 20:55:55 -0800 (PST)
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2013 20:55:55 -0800
Message-ID: <CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] adjust BBPATH to be a good citizen of layer world
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
X-List-Received-Date: Thu, 07 Nov 2013 04:56:27 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 6, 2013 at 8:29 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> This seems like a reversal of http://arago-project.org/git/meta-ti.git?a=commit;h=dabd83e96fe99d0c3d1a88be4d1637831526d217
>
> Looks like there may be a need to cover the different use cases and understand what each person is trying to do :)
>

ah I see what caused this all pain. So now meta-ti is odd ball out.
this patch should have never gone in.

>>-----Original Message-----
>>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>bounces@yoctoproject.org] On Behalf Of Khem Raj
>>Sent: Thursday, November 07, 2013 7:55 AM
>>To: meta-ti@yoctoproject.org
>>Subject: [meta-ti] [PATCH] adjust BBPATH to be a good citizen of
>>layer world
>>
>>Currently, meta-ti appears as first path in BBPATH
>>rest of layers append so lets do the same
>>
>>helps distros with multiple BSP layers to include meta-ti
>>
>>Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>---
>> conf/layer.conf | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/conf/layer.conf b/conf/layer.conf
>>index e39bd85..faa4ac0 100644
>>--- a/conf/layer.conf
>>+++ b/conf/layer.conf
>>@@ -1,5 +1,5 @@
>> # We have a conf and classes directory, append to BBPATH
>>-BBPATH =. "${LAYERDIR}:"
>>+BBPATH .= ":${LAYERDIR}"
>>
>> # We have a recipes directory, add to BBFILES
>> BBFILES += "${LAYERDIR}/recipes*/*/*.bb
>>${LAYERDIR}/recipes*/*/*.bbappend"
>>--
>>1.8.3.2
>>
>>_______________________________________________
>>meta-ti mailing list
>>meta-ti@yoctoproject.org
>>https://lists.yoctoproject.org/listinfo/meta-ti

