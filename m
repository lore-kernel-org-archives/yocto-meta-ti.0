Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC66EE00AC8; Sun, 23 Aug 2015 17:56:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.182 listed in list.dnswl.org]
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3975E00ABE
	for <meta-ti@yoctoproject.org>; Sun, 23 Aug 2015 17:56:46 -0700 (PDT)
Received: by igbjg10 with SMTP id jg10so49646608igb.0
	for <meta-ti@yoctoproject.org>; Sun, 23 Aug 2015 17:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qIsiQNspkETs9XWmkU3s/y5ZW/hUUqQi6c92wRB9qxA=;
	b=agZiXIiLTKeJCmcNsLyoTIujpLrbbbfWaAOvU4gD9MfnkZPbEHzCgzI29BhMEHrYy9
	YSqXIsHaf7vS3kYvGi990C20SEcr2QhiB0gvx6+45tu6FPL88ZfFbmIaPVCkR62z+Czf
	J46G7+zO+md575Q7FQ//vBxhhzcwOvB5EFaLZ2P9t4m/B6VgVY+7RG1dj8VZhSboZf7N
	9tshSP4lTdziTAHOcOYzSkhrYG0augsk4bvd5MkSZ0jPlZzDNmcBxxnxLNRmfO0gQ0e5
	q2t8eEQpd3kBLSMdSpdwhunRhsNMmZovXTOY+edyNOSLpIgySW+EJpvJvqhNsrhM/Les
	ibzw==
X-Received: by 10.50.47.70 with SMTP id b6mr12186681ign.59.1440377806320; Sun,
	23 Aug 2015 17:56:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.183.6 with HTTP; Sun, 23 Aug 2015 17:56:16 -0700 (PDT)
In-Reply-To: <2062145486.7469712.1439977584428.JavaMail.yahoo@mail.yahoo.com>
References: <20150818221434.GH6542@edge>
	<2062145486.7469712.1439977584428.JavaMail.yahoo@mail.yahoo.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Sun, 23 Aug 2015 19:56:16 -0500
Message-ID: <CAOCHtYjt6i2WpvrtfBE7sTkWi-xW-UN=-z42F6BGXwGijcfPBg@mail.gmail.com>
To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
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
X-List-Received-Date: Mon, 24 Aug 2015 00:56:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 4:46 AM, Benjamin Bimmermann
<b.bimmermann@yahoo.de> wrote:
> Thank you,
>
> now my last question for this Topic:
>
> When will this new version for 4.1 be realese ?
> This mounth ? This year? Is there a date approximate date?

Why wait?

Just patch the kernel yourself..

https://github.com/RobertCNelson/ti-linux-kernel-dev/tree/ti-linux-4.1.y/patches/sgx

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

