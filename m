Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04E50E013D1
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 08:23:55 -0700 (PDT)
Received: by mail-ob0-f180.google.com with SMTP id v19so2119876obq.25
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VO3+IkmQRYjLujYhAQhYrhc9wsjoC3n3y2E3yQdDNXM=;
	b=zbSp1zBSGwQhWa6aMy3/INmFEepv8v9MBvHy6ROsUJOfQ1UWygCrICOUOld98p3nIW
	tNU9Rt7dLsf6+TmlJm2NXUKxKiYdBpR1P+zQX0w8w2IVRQjzbFZ0NkBVfbSBFdzrvtMx
	zjqyuLdyVNFq+THyn5C+wI7KoLUZJQ7qNMfcHtXBki3LecrrT2+ptMa9+1V4X1O+uXIt
	cLpbUGMvgRaqi+C+OA7YwGV2Xrk4wbf2vlqu0hniOc3e6GMxwC21Ddnpzx4v8gn6aQWa
	jQeD6Iyr2WJdcZgoXBQRnG5DilUHTlMZsACHWpXGAhf5/W2O4fFUEiNGWSUZ7UeJ2ues
	jt0g==
MIME-Version: 1.0
X-Received: by 10.182.34.194 with SMTP id b2mr14617650obj.41.1377185035243;
	Thu, 22 Aug 2013 08:23:55 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 22 Aug 2013 08:23:55 -0700 (PDT)
In-Reply-To: <20130822024616.GA25063@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
	<20130822024616.GA25063@edge>
Date: Thu, 22 Aug 2013 11:23:55 -0400
Message-ID: <CAFZh4h9Ru3iED9ASmxqs14Pve+foh3gg15OBnVtfNR-B_b1rMQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 22 Aug 2013 15:23:58 -0000
Content-Type: multipart/alternative; boundary=001a11c2275ed0dad704e48ae0de

--001a11c2275ed0dad704e48ae0de
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 10:46 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
>
> Well, if you use Dylan (or even Danny), it has a recipe already available
> in
> oe-core...
>
>
Yes, I found this one that Khem added checksums to and used web git to
cherry pick it out:
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb?h=dylan&id=370e082c8bbf14c9b0f54269eb99d291d187cd40

Regards,

Brian

p.s.  Killing all those binaries the QA caught fixed my do_package problem
yesterday.

--001a11c2275ed0dad704e48ae0de
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Aug 21, 2013 at 10:46 PM, Denys Dmytriyenko <span =
dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex">
<div class=3D"im"><br>
<br>
</div>Well, if you use Dylan (or even Danny), it has a recipe already avail=
able in<br>
oe-core...<br>
<div class=3D""><div class=3D"h5"><br></div></div></blockquote><div><br></d=
iv><div>Yes, I found this one that Khem added checksums to and used web git=
 to cherry pick it out:</div><div><a href=3D"http://cgit.openembedded.org/o=
penembedded-core/commit/meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_2.6.37.2.bb?h=3Ddylan&amp;id=3D370e082c8bbf14c9b0f54269eb99d291d187c=
d40">http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-ker=
nel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb?h=3Ddylan&amp;id=3D37=
0e082c8bbf14c9b0f54269eb99d291d187cd40</a><br>
</div><div><br></div><div>Regards,</div><div><br></div><div>Brian</div><div=
><br></div><div>p.s. =A0Killing all those binaries the QA caught fixed my d=
o_package problem yesterday.</div><div>=A0</div></div></div></div>

--001a11c2275ed0dad704e48ae0de--
