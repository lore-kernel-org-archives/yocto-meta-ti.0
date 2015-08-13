Return-Path: <anders@chargestorm.se>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F92FE009C5; Thu, 13 Aug 2015 02:36:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0298E00947
	for <meta-ti@yoctoproject.org>; Thu, 13 Aug 2015 02:36:22 -0700 (PDT)
Received: by lahi9 with SMTP id i9so22862046lah.2
	for <meta-ti@yoctoproject.org>; Thu, 13 Aug 2015 02:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=LIFvNM/MPy07x5XvycA5XNnWv+lVwQCH4sqdU4pLiCM=;
	b=UlhspTYIHzoz6ecUscbHwU6ccB7W6Z570ZEvMCrNcii6VYyKDHzL2YyR5vLCVQKvsU
	zdngIxQqFuVA7931KKgNk5sd7vHkmZ673RoA5H8pYaApehNimVWR4P9JFgBh7v9a3r/i
	xfp+tb9qO+6uFzA5IZkTl4l/Hh0K2y5CCQI8X71AUfXKvRFy+nV0aA860cN0iClPNAPe
	rK0KhZuAkVTP6DU/AukwZpaf2yKr+5Cta6+CHFhuy9QXoQwVp7SZjdP3n3nLwCdVIgmY
	dIhuBb4TiyHOKjPtTjdouHGLGLMc/KkRLOoNwXx8nXDI/kd3bm7PZRDmLQVA3w6g0RLQ
	HfBQ==
X-Gm-Message-State: ALoCoQlF4fxj8z9EL4yFRqCLcyDhtbDw2PhOVwB5+yKB2pNOyQXKYskbKNwe0EHm1+kkXccxR33A
X-Received: by 10.112.42.172 with SMTP id p12mr35224395lbl.52.1439458580104;
	Thu, 13 Aug 2015 02:36:20 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	kv12sm407396lac.11.2015.08.13.02.36.19 for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 02:36:19 -0700 (PDT)
Date: Thu, 13 Aug 2015 11:36:17 +0200
From: Anders Darander <anders@chargestorm.se>
To: meta-ti@yoctoproject.org
Message-ID: <20150813093617.GE15357@ad.chargestorm.se>
Mail-Followup-To: meta-ti@yoctoproject.org
References: <CADySD0GDcbUR7wRYgj1jnX4D24vhBg57SoTam+P326fLZuE1Lw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GDcbUR7wRYgj1jnX4D24vhBg57SoTam+P326fLZuE1Lw@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Valgrind doesn't give stack trace
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
X-List-Received-Date: Thu, 13 Aug 2015 09:36:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Ankur Tyagi <ankur.tyagi85@gmail.com> [150813 06:26]:
> I am using Valgrind coming from yocto on my AM335x-EVM kit.

> But when I try to use valgrind, it doesn't give me stack trace. Following
> is what I get :

See my reply on meta-arago:
http://arago-project.org/pipermail/meta-arago/2015-August/006016.html

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

