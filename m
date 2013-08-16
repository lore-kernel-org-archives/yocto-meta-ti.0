Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C07C7E00406
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:46:17 -0700 (PDT)
Received: by mail-ob0-f180.google.com with SMTP id up14so2568995obb.25
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ekO/mxF6rswA4xcG6E8zeoAtsuWhgt0pSVyqPmzEFJk=;
	b=n4DWGq/VT7VQkGdxKkc5caW0n3tDUxQTnnA66q/qN009pJiHwXylpLbap9DWJfNOyn
	ric9O2bSTc0VXshW/QFPQ8Eegy8+FgVnofXv2HwAOR8Im7lcTjgBMAO61fSt2U9s6p6o
	hk8XE0hc7pRistYl6kG1h7/b+TLIoLK5cKvjr1cRAeKB4FiaXYHHVe9WMszMQZpyaAvj
	/QRprJz6WCqbxJr5x1V/4SbFOaNBFgGVVYwSC43YYkGe4JZjbvXwNgOw6UScwDD9Y+n5
	xYQG2wakZxdDHIvXCsyZmgtQA5yzr/uIwl6d2ewVtHi9L3kBzTQcTbrU7V88ctc0GNX5
	BVxA==
MIME-Version: 1.0
X-Received: by 10.182.18.9 with SMTP id s9mr3157111obd.15.1376689577059; Fri,
	16 Aug 2013 14:46:17 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 16 Aug 2013 14:46:16 -0700 (PDT)
In-Reply-To: <CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
Date: Fri, 16 Aug 2013 17:46:16 -0400
Message-ID: <CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Fri, 16 Aug 2013 21:46:18 -0000
Content-Type: multipart/alternative; boundary=001a11c2d6a034ea5f04e41785b3

--001a11c2d6a034ea5f04e41785b3
Content-Type: text/plain; charset=ISO-8859-1

... and I get a similar udev message that started me down this road in the
first place but at least this time it is a little more helpful.  Looks like
I need to run down inotify support now:

Starting udev
<30>udevd[81]: starting version 182
udevd[81]: inotify_init failed: Function not implemented

udevd[81]: error initializing inotify

Regards,

Brian

--001a11c2d6a034ea5f04e41785b3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">... and I get a similar udev message that started me down =
this road in the first place but at least this time it is a little more hel=
pful. =A0Looks like I need to run down inotify support now:<div><div><br></=
div>
<div>Starting udev</div><div>&lt;30&gt;udevd[81]: starting version 182</div=
><div>udevd[81]: inotify_init failed: Function not implemented</div><div><b=
r></div><div>udevd[81]: error initializing inotify</div></div><div><br>
</div><div>Regards,</div><div><br></div><div>Brian</div><div><br></div><div=
 class=3D"gmail_extra"><br></div></div>

--001a11c2d6a034ea5f04e41785b3--
