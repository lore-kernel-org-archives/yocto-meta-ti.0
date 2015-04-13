Return-Path: <twoerner@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A8E2E00998; Mon, 13 Apr 2015 06:24:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (twoerner[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.173 listed in list.dnswl.org]
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2E25E00963;
	Mon, 13 Apr 2015 06:24:48 -0700 (PDT)
Received: by igbyr2 with SMTP id yr2so9191116igb.0;
	Mon, 13 Apr 2015 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=xM1ukIL9lINiBO8N164Y/KQ+rlwVEn6JmgKdkrj6XwU=;
	b=REPY8t2UWRxKrF92iZHnqACJY52WQ4VZ4hE8nxZJryCh5iUEjH59QzEXWxLJl/4zP4
	pN9CImj9mOeHQQVlMnat8VjgKecveL6zWZ8HnxtjMJQGERWD/hSmFzJSlS/+UAm3lFUB
	r3lqcFiRGXZfh/kusaJsbYYYyXLGRCfQrVeEdYd3rr8+aiPakLr2ciuI17be5K/vayc9
	mgR2sU+s4DyAw5Se50/YDeGPGZBjz+ht492fsu7XQhGy03NF3mIwYTCHBphf807d7RDw
	atNVRBKtGi2SXwXiqbWIG7sZ6O3CDZabwFxQylHzGvk+q/wh9JeGMIeOzRPNbsYfalhW
	OEyQ==
X-Received: by 10.107.156.19 with SMTP id f19mr21172804ioe.45.1428931487862;
	Mon, 13 Apr 2015 06:24:47 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-204-50-155.acanac.net. [67.204.50.155])
	by mx.google.com with ESMTPSA id
	o196sm4927408ioe.26.2015.04.13.06.24.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 06:24:47 -0700 (PDT)
Message-ID: <552BC39D.7000806@gmail.com>
Date: Mon, 13 Apr 2015 09:24:45 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Stephen Flowers <sflowers1@gmail.com>, yocto@yoctoproject.org, 
	meta-ti@yoctoproject.org
References: <54DA0258.9070108@gmail.com>
In-Reply-To: <54DA0258.9070108@gmail.com>
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
X-List-Received-Date: Mon, 13 Apr 2015 13:24:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Stephen,

(replying to really old post, sorry)

On 02/10/15 08:06, Stephen Flowers wrote:
> I have built the realtime kernel using Yocto and deployed on the
> beaglebone black (specifically core-image-rt-sdk).

I'm curious to know how you built your image. When I try "bitbake
core-image-rt" or "bitbake core-image-rt-sdk" bitbake complains about
incompatibilities "not in COMPATIBLE_MACHINE" for linux-yocto-rt.

Best regards,
    Trevor

