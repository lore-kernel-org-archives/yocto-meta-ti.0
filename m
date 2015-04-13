Return-Path: <sflowers1@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53CBAE00998; Mon, 13 Apr 2015 06:38:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (sflowers1[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 136FFE00963;
	Mon, 13 Apr 2015 06:38:00 -0700 (PDT)
Received: by qkx62 with SMTP id 62so180650502qkx.0;
	Mon, 13 Apr 2015 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=aUxOS3pYOojSx9CmAJ1zqQuVlNGPaRwzfBPwSNsZqAQ=;
	b=ohV7IX2QSDi/w5XtkibofrQyyUEy2ourK7Cis5Uf6s6lwqBo4UWdCftofKz+woRYJq
	XIs9ttBGcmQC2jjsVtd/Ug8O5PPhAkhGjF7V2yVlgsFWdCbZnLzbnHDDvnh1zzbhF0TL
	Oxn9WXhZggReggGS/Xc2Otq53E74+Gp1w96osY8upCne7XJQdNZcI99OPKhGbtkyd0rq
	35OiPKIJxkN1m5FuoMQpR/rQRWOEbURMW6aD4uPFPPjV9MNJOTaGHTtNt5FZUHbNgZCk
	gYPIH6wxQVWsUHVBh4XvuOrAqsvO+HKRcEWi/ePXeBN6MDZFYSdp4evwclEaUfq5DT/b
	ULWA==
X-Received: by 10.229.29.136 with SMTP id q8mr18769807qcc.2.1428932279940;
	Mon, 13 Apr 2015 06:37:59 -0700 (PDT)
Received: from [10.158.50.129] ([89.191.218.226])
	by mx.google.com with ESMTPSA id u48sm5827625qgd.34.2015.04.13.06.37.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 06:37:59 -0700 (PDT)
Message-ID: <552BC6AA.5020704@gmail.com>
From: Stephen Flowers <sflowers1@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>, yocto@yoctoproject.org, 
	meta-ti@yoctoproject.org
References: <54DA0258.9070108@gmail.com> <552BC39D.7000806@gmail.com>
In-Reply-To: <552BC39D.7000806@gmail.com>
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: Re: [yocto] Yocto Realtime tests on beaglebone black
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
Date: Mon, 13 Apr 2015 13:38:02 -0000
X-Original-Date: Mon, 13 Apr 2015 14:37:46 +0100
X-List-Received-Date: Mon, 13 Apr 2015 13:38:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Trevor,

I added the following to .../build/conf/local.conf

PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"
COMPATIBLE_MACHINE_beaglebone = "beaglebone"
COMPATIBLE_MACHINE_quilt-native = "beaglebone"

Then change the required package within 
/meta/recipes-rt/images/core-image-rt.bb from -minimal to -base
(base package is not working for some reason - no files created within 
target /boot folder)

Then I added some desired features to the build not found in -base
EXTRA_IMAGE_FEATURES = "debug-tweaks dev-pkgs tools-sdk"

Then the build succeeded... after about 4 hours :-)


On 13/04/2015 14:24, Trevor Woerner wrote:
> Hi Stephen,
>
> (replying to really old post, sorry)
>
> On 02/10/15 08:06, Stephen Flowers wrote:
>> I have built the realtime kernel using Yocto and deployed on the
>> beaglebone black (specifically core-image-rt-sdk).
> I'm curious to know how you built your image. When I try "bitbake
> core-image-rt" or "bitbake core-image-rt-sdk" bitbake complains about
> incompatibilities "not in COMPATIBLE_MACHINE" for linux-yocto-rt.
>
> Best regards,
>      Trevor


