Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85237E00596
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2012 23:35:16 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so293628wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2012 23:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Mm+JYz6+u1N1pIYixJpok7RXea0CarnnDqm5FU8F06U=;
	b=bziRrmcnymuOfyXklU0COp4q/lX4y25zjJzdUBWXxlxFo2Z3ZbtZCXuEraXJN5/hSd
	AXrM+mNNC7mJJ+5eQalBaPg1SnsO1+QCr8gSB8OlOxxFQ57my43Kibiu0DJCrQ2HmV13
	Ttw74jrGQFj8l43Oa6qvha3de+/i2atCs4czeQWm3ELglN3RIrCoY6ChMGEGdwBHOjzP
	+tnDAbSSiknt+G110RfEWUCLJvY2w4L358fxW7VJhWKN6aoq6g0P/jBVhJN6qrEG3mE+
	aKKYwYVuzo4hwH0TiXzVaef2Zd0XsO1aRAanDN0GZdKYeCATRXsmVjiM/HdweSUl0GHQ
	iZcg==
Received: by 10.216.131.154 with SMTP id m26mr5803460wei.91.1335508515027;
	Thu, 26 Apr 2012 23:35:15 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j3sm4185452wiw.1.2012.04.26.23.35.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 23:35:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F99D47A.9030300@r-finger.com>
Date: Fri, 27 Apr 2012 08:35:14 +0200
Message-Id: <D33894FA-C075-41AC-AA29-03244BD94960@dominion.thruhere.net>
References: <4F99ABC7.9080807@r-finger.com>
	<D71943B7-3840-49F0-B184-9D5666C43F19@dominion.thruhere.net>
	<4F99D47A.9030300@r-finger.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQm7DaFcSBiYSOw5cc7c0T5VezikCJKYx7eBn0DrSmLu/AKCX9dx/DEyXOD8LeLd+lqKZkBx
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
X-List-Received-Date: Fri, 27 Apr 2012 06:35:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2012, om 01:04 heeft Tomas Frydrych het volgende geschreven:

> On 26/04/12 23:40, Koen Kooi wrote:
>>=20
>> Op 26 apr. 2012, om 22:10 heeft Tomas Frydrych het volgende =
geschreven:
>>=20
>>> Hi,
>>>=20
>>> I am trying to get native egl (i.e., without X) working on =
Beagleboard
>>> xM, but without much success. I am using libgles-omap3 (4.05.00.03) =
the
>>> kernel(s) and sgx drivers from meta-ti master; everything appears to
>>> start fine (i.e., no errors reported from pvr-init or dmesg), but =
trying
>>> run any of the gles tests / demos gives:
>>>=20
>>> 'eglInitialize' returned egl error 'EGL_BAD_ALLOC' (0x3003)
>>>=20
>>> I have tried both linux-omap 2.6.39 and linux 3.0.8, with same =
results.
>>=20
>> Both of those aren't the default, so are you actually using =
meta-ti?!?
>=20
> Hm, so which is meant to be the 'right' beagleboard kernel? The =
default
> virtual provider in meta-ti beagleboard.conf is linux-omap

No, it isn't.

> , and based on
> the priorities it seems to work out that 2.6.39 is the preferred
> version. I am quite happy to try yet a different kernel, of course :)
>=20
> (I am only using the kernel and related recipes from meta-ti.)

Try using the machine.conf as well:


koen@dominion:/OE/angstrom-v2012-05/sources/meta-ti$ git log --oneline =
-1
51617ea cloud9-gnome-image: same as cloud9-image, but with GNOME added =
to it

koen@dominion:/OE/angstrom-v2012-05/sources/meta-ti$ git grep =
PREFERRED_PROVIDER_virtual/kernel | grep beagle
conf/machine/beagleboard.conf:PREFERRED_PROVIDER_virtual/kernel =3D =
"linux"
conf/machine/beaglebone.conf:PREFERRED_PROVIDER_virtual/kernel =3D =
"linux-ti33x-psp"


