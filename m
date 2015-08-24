Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C8B9E00BAB; Mon, 24 Aug 2015 12:39:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 559F5E00927
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:39:25 -0700 (PDT)
Received: by iodt126 with SMTP id t126so161869183iod.2
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AxOnjfe4oxlLWOT30lo9tbx+TkEtNIPn+UZkbOPaXMI=;
	b=hAqsVRdXKoNGFYVUZamrl9agqdrhO+NT0iBuXm+s4bqzmtILr6QbmIYba2HkNnFC3Z
	O9o7PvWVL47KmOuzFjgpBSVHVMMR/Y+igAO/bOwkEtsgw2G57dkFu6e0dCzEqNO8kHz/
	rFMcxFWTXxqrq9ID8ll3a666OvbK3/MJ//8ERp9BzYUdQjk4wwnSqjf3DfuNqfkhU/uJ
	5TpxivMa9R0zU0tir4LskP/lkzY9eB9eHA+GogxEOujtE4+fKZr9Daz3yIJ3ocbmg5ZQ
	5NGVNystsvxuFdw3pITIqndVJMPTPCnp9IoyDRB39HXORJRKZsQFJWlPkizlQMbtNz2e
	JyMw==
X-Received: by 10.107.25.1 with SMTP id 1mr18538914ioz.39.1440445165065; Mon,
	24 Aug 2015 12:39:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.183.6 with HTTP; Mon, 24 Aug 2015 12:38:55 -0700 (PDT)
In-Reply-To: <20150824193527.GW6542@edge>
References: <20150818221434.GH6542@edge>
	<2062145486.7469712.1439977584428.JavaMail.yahoo@mail.yahoo.com>
	<CAOCHtYjt6i2WpvrtfBE7sTkWi-xW-UN=-z42F6BGXwGijcfPBg@mail.gmail.com>
	<20150824193527.GW6542@edge>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Mon, 24 Aug 2015 14:38:55 -0500
Message-ID: <CAOCHtYiNgvSgz3p2zC+AdGevGaOEQ98qqFvw6HDQW+rhsd05Kg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Mon, 24 Aug 2015 19:39:27 -0000
Content-Type: text/plain; charset=UTF-8

Hi Denys

>> Why wait?
>>
>> Just patch the kernel yourself..
>>
>> https://github.com/RobertCNelson/ti-linux-kernel-dev/tree/ti-linux-4.1.y/patches/sgx
>
> Thanks, Robert,
>
> I see you've taken our old patches we used on 3.14... We are currently working
> on replacing the old libgles-omap3 graphics stack with a different version and
> Wayland support. Hoping to get it ready soon...

Yeap, those are from 3.14.x, for the classic 5.01.01.02 release. We
have a few bb.org users who have been using that successfully on
4.1.x-ti & mainline 4.1.x/4.2.x kernel's..

can't wait for a wayland release for the am335x. ;)

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

