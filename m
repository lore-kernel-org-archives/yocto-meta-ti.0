Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D282DE004DD
	for <meta-ti@yoctoproject.org>; Wed, 19 Feb 2014 12:32:03 -0800 (PST)
Received: by mail-ie0-f170.google.com with SMTP id rl12so634259iec.1
	for <meta-ti@yoctoproject.org>; Wed, 19 Feb 2014 12:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bY7hqhqpQVDQmVvY8YF+6P7G/Qg1RXkRy8i2AN+tQ2k=;
	b=ha9MxhRoC9P12OU9VPRnHGCHXJultDc+arW/WUaxqbKdQsKzlMre0rVTJ56jLPpgqO
	qI9tu9db1s03h7vC9ht0JSM1vB13/Fo6KW9rSN3lFY8pbHLLFRSz0t2SX14Suj9k6/eS
	mET87hba43gs4vIxrlBtB1A6Sm+Y6ZpMJzSQUbTPMlTor++0memknNVyoQuZpyiZuKos
	2hDS4j4WV337+6kUxm+8l1aXyplgu2ppgT+FStbvevDwwW2peIawb9qX4Qv0Tt7+2WX7
	TYfdlUOH5ATJ5RefVeYgisgwJ1e4kN5qpxfIslOPpuxkde2PjplvaRmUrEtxxRopmFPl
	oVgQ==
X-Received: by 10.50.143.69 with SMTP id sc5mr3340091igb.2.1392841922874; Wed,
	19 Feb 2014 12:32:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Wed, 19 Feb 2014 12:31:32 -0800 (PST)
In-Reply-To: <CA+ujt=q+j7sBLqCFaAwomZepAah2R-y7=bp_H38otNvBUNznyg@mail.gmail.com>
References: <CA+ujt=q+j7sBLqCFaAwomZepAah2R-y7=bp_H38otNvBUNznyg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Feb 2014 12:31:32 -0800
Message-ID: <CAMKF1spN2gOjTav18Qi+FObE+QxVohQ89KObNoQe-MgwX8=Trg@mail.gmail.com>
To: Eric Seuret <eric.seuret@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Support for capemgr
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
X-List-Received-Date: Wed, 19 Feb 2014 20:32:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 19, 2014 at 1:30 AM, Eric Seuret <eric.seuret@gmail.com> wrote:
> I have been toying around with yocto and the meta-ti layer for my beaglebone
> black and I am able to build and boot an image (I made core-image-basic).
> However i don't seem to see the capemgr in my /sys/devices.

may be you will have better luck trying kernel from meta-beagleboard

