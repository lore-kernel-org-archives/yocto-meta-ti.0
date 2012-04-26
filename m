Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BF30E00596
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2012 15:40:44 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so101609wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2012 15:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=76VRWBpG4Pxb0PICEJG8a3F3+AKAhHrCeGl4HamWvGU=;
	b=l6wiS7XUqfJngovfC8JP/f3tGYri+y/SUuscXyJjfqMQa72R5ja2qHEVAXeD1bEWi3
	HotugDWsLCcVB+ZhOcSFRzglOOBEbMPx4z86ccVzEM5F/hZPUF6zus9ELElT/cfwBrJn
	BVsFF+s6/amqgmC8xecELBNzD5gEk/qJtyWF1C8w0dvYWnt9ft4ziiLk+awNztDfxg7T
	ddTRbc1+5MY62qtsLZb2q7ZRHgRBM5w3wu9r8YEK4DXSrrHzxA/m+gQ7Z5y/iT/0kw8S
	WugWBb2uQmZqHn0H9vJ1njBe4kbvJi6ECkYKlR9UQ6OpnkNHW4mV11wQXPC6JNhQPBvW
	a6mg==
Received: by 10.216.143.209 with SMTP id l59mr5256764wej.87.1335480043864;
	Thu, 26 Apr 2012 15:40:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm217221wib.3.2012.04.26.15.40.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 15:40:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F99ABC7.9080807@r-finger.com>
Date: Fri, 27 Apr 2012 00:40:39 +0200
Message-Id: <D71943B7-3840-49F0-B184-9D5666C43F19@dominion.thruhere.net>
References: <4F99ABC7.9080807@r-finger.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnRexq/vKDkawFNbHeM4TnM3dogc8qYCW8Uu33n+/JgXsbAjR52nml1icayCuroa6Wuy7sD
Cc: meta-ti@yoctoproject.org
Subject: Re: egl on beagleboard xM
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2012 22:40:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 26 apr. 2012, om 22:10 heeft Tomas Frydrych het volgende geschreven:

> Hi,
> 
> I am trying to get native egl (i.e., without X) working on Beagleboard
> xM, but without much success. I am using libgles-omap3 (4.05.00.03) the
> kernel(s) and sgx drivers from meta-ti master; everything appears to
> start fine (i.e., no errors reported from pvr-init or dmesg), but trying
> run any of the gles tests / demos gives:
> 
>  'eglInitialize' returned egl error 'EGL_BAD_ALLOC' (0x3003)
> 
> I have tried both linux-omap 2.6.39 and linux 3.0.8, with same results.

Both of those aren't the default, so are you actually using meta-ti?!?

