Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7979E006EF; Thu,  4 Sep 2014 12:07:53 -0700 (PDT)
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
	*      [209.85.213.181 listed in list.dnswl.org]
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 693E1E004A0
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 12:07:45 -0700 (PDT)
Received: by mail-ig0-f181.google.com with SMTP id h15so1717175igd.14
	for <meta-ti@yoctoproject.org>; Thu, 04 Sep 2014 12:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UHqtxhM5Mboy6JjxjoT9ZqGICnXSthwSbxeHLgiLvsY=;
	b=JzSpUbH6aaevqtNLPB2H5wt6tUev8YU+I1mX+hA2Du2IW8imixTQ4sd4qTjgDcusY8
	z5WWs7f3Mxr46bop02OTvjvfegJJPHoyQakqTifgwlCwgLgLHTmq+4Ulw5cuw7buPE2+
	CVx/4+FRc81Pin+WeCIkdo3cIfcBpuFc9Zxw7ARX2ikeoGkotJ29OHXAZwPJm58Hpo8c
	jnopS/dZSQBzzxAYrzJw1NfPfPtzmcirlQH21vpVpnp3k67U27l+T722hvDKkmWmEVSW
	roJZr4TmAG4+vMCLSDZrednvnfRW3SYnLWt8JWyB9SKvxnUBTQk4qTaflh/zOjMi1x46
	Lv1g==
MIME-Version: 1.0
X-Received: by 10.50.25.105 with SMTP id b9mr10145713igg.46.1409857664855;
	Thu, 04 Sep 2014 12:07:44 -0700 (PDT)
Received: by 10.107.166.16 with HTTP; Thu, 4 Sep 2014 12:07:44 -0700 (PDT)
In-Reply-To: <5408B7B4.9090504@pabigot.com>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge>
	<CAOCHtYgkaixBwP84Ocqa4y9H1_9__Y1BR-2UKGeiUXn0Bhk_+Q@mail.gmail.com>
	<20140904181056.GO18620@edge> <5408B7B4.9090504@pabigot.com>
Date: Thu, 4 Sep 2014 14:07:44 -0500
Message-ID: <CAOCHtYg5L55eyNUxiKSsh=NVObu1MfcAQdqC-VdMdcYWPmFc-Q@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 19:07:54 -0000
Content-Type: text/plain; charset=UTF-8

> Indeed, the A5C has a 962A chip which is Si 2.0, while the B has a 962B chip
> that is Si 2.1, per SPRZ360F.

Found my "A4" don't think anything earlier went out

962: 1.0

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/

