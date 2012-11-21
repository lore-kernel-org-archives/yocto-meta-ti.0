Return-Path: <ross.burton@intel.com>
Received: from fmsmga102.fm.intel.com (mga10.intel.com [192.55.52.92])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4169E00294
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 15:33:55 -0800 (PST)
Received: from mail-ie0-f200.google.com ([209.85.223.200])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Nov 2012 15:33:55 -0800
Received: by mail-ie0-f200.google.com with SMTP id 10so33105776ied.11
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 15:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=evWKTmgWGBx8nXd/KV0gNkPhoZ0y/Cy6XOX0/NikMCs=;
	b=Cp0cCF3bBaYNsFjixUUOYLpAL5Ox4Tj/nsMZ7yq3liyg8S4V4Q/U4xLldJP0Qdiunu
	3mcuNCyT1eeKlDolldwdbTH3RqdQIayyyfavCIH96UX1Tp6a9scNc/TtS6cigSwCCZ9K
	TE2AvZfDE7zv+MumAjGTj3V7pBz5QKnJNkP5/WXS5RrsuviLCoLXxpA35PAiEfvX9DI3
	3ssJkenF/eM4c3p9bHV8YanfzNgfXUDhRhyzNY2gU/C8z4UOISr/xjRanVpkFXA1+1Js
	Kc8SUlednFT28EJoNn2jsHsPl95NqcqpiVperzjDC9lNXOnMR9T5HKvGm4kp21Z8Fw4M
	Ff2A==
Received: by 10.60.172.178 with SMTP id bd18mr9170683oec.133.1353540834077;
	Wed, 21 Nov 2012 15:33:54 -0800 (PST)
Received: by 10.60.172.178 with SMTP id bd18mr9170674oec.133.1353540833937;
	Wed, 21 Nov 2012 15:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.154.37 with HTTP; Wed, 21 Nov 2012 15:33:33 -0800 (PST)
In-Reply-To: <CAOT3miJf7yh=1c-xxfZ-sxZt4RUvufcgVTMv0Dzw=kSbz5wXaA@mail.gmail.com>
References: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
	<CAJTo0LYLf=296eEZznK7vnFTJZhAS_u1opuXdyJ=MUvRYF1Asw@mail.gmail.com>
	<CAOT3miJf7yh=1c-xxfZ-sxZt4RUvufcgVTMv0Dzw=kSbz5wXaA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2012 23:33:33 +0000
Message-ID: <CAJTo0LbCWQTs2aBBWvjeqXD-o6n48SfvBgBJCEFLN1kHtCPXiQ@mail.gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
X-Gm-Message-State: ALoCoQlfXVGdnQA+uUIJszM7IYMHjocQEaK1OFoiTbP4FqOiRIypPI/QGVFgI92iAVO4b7E7dZu8/fVivAkX/bJmk65pAvo7/TRQlWKEt0f336d+ggjiRZmQ1/kDb/hpjJM7qxVkBRvTGcI7WbJTzgPBP82dwjcUog==
X-Mailman-Approved-At: Wed, 21 Nov 2012 15:41:05 -0800
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, rob@ti.com,
	yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] build failure with xf86-video-omap
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
X-List-Received-Date: Wed, 21 Nov 2012 23:33:56 -0000
Content-Type: text/plain; charset=UTF-8

On 21 November 2012 23:26, Nicolas Dechesne <ndec13@gmail.com> wrote:
>> As this is a genuine upstream bug (ARM-specific driver that doesn't
>> cross-compile?!) I've just filed fdo #57386.
>
> i suspect you opened a OE bug, since I can't find it in yocto BZ, however
> bugs.openembedded.org doesn't seem to answer at the moment..
>
> so, I checked our configure.ac , and clearly, that needs some love...
>
> Rob: any chance you can look into that? it's the xf86-video-omap
> configure.ac file that's wrong, we should mimic what's in the xf-video-intel
> one i guess..  otherwise i can try later this week.

fdo - https://bugs.freedesktop.org/show_bug.cgi?id=57386

I started replacing the AC_CHECK_FILE with PKG_CHECK_EXISTS, but now
I'm wondering why DRI_CFLAGS DRM_CFLAGS are being used without being
apparently defined.  Is this configure.ac needing a bit of a clean or
am I misunderstanding something?

Ross

