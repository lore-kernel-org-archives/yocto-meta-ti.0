Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB0E7E013D1
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 12:35:59 -0700 (PDT)
Received: by mail-oa0-f46.google.com with SMTP id j10so4288175oah.5
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jbgKMWHCNL97RMDvULZvRtcWBBUvI/om20mUw5A9ptk=;
	b=PLYPAeCAl/tlXRaWC04w+tkIxlLn56/etT3o+BHbQZaggvro3k7CmNQst/Zk+ntWVF
	SSA5SDeHVeErwG6CSTmMYRF3FsxFKCoNLcii21uyWl5tVDmgeTzSKxcZcvrU5/bFprAj
	/Kku22nGhW9kW9qGKtsakVly7QRCGWKgQhDMlH4E31JfKm5K5LzHE4Cs9Vokoa4zp/So
	smOufRJI+IrLmB8JMAUmkU8A14/KJqrIYoazJuJ2eMy/zATMOPZ9peYrYlsshFa6567s
	1AIPwABamaZc4CI1JeeS1JroLeFiS51+bivOrPGG/LLYP+6D07CZJnZ8yqORMSxiYqFY
	4sKg==
MIME-Version: 1.0
X-Received: by 10.182.225.134 with SMTP id rk6mr16234167obc.40.1377200158940; 
	Thu, 22 Aug 2013 12:35:58 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 22 Aug 2013 12:35:58 -0700 (PDT)
In-Reply-To: <20130822185445.GD25749@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
	<20130822024616.GA25063@edge>
	<CAFZh4h9Ru3iED9ASmxqs14Pve+foh3gg15OBnVtfNR-B_b1rMQ@mail.gmail.com>
	<CAFZh4h8avM4+=5zDuB_6N4bJL5jLKaUPSi8VK66d1+NunaZx+w@mail.gmail.com>
	<20130822185445.GD25749@edge>
Date: Thu, 22 Aug 2013 15:35:58 -0400
Message-ID: <CAFZh4h-e9iusAaQbbijZ4o4JpQ+4d_YdmJBe=E0zRU6i9m9ZKw@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Aug 2013 19:36:02 -0000
Content-Type: multipart/alternative; boundary=001a11c2f80042231204e48e66b1

--001a11c2f80042231204e48e66b1
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 2:54 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> > OK, I don't know if I did this right or not but now I have a
> > linux-libc-headers_2.6.37.2.bb (from the web git link I mentioned
> before)
> > file in my meta/recipes-kernel/linux-libc-headers directory.  In my
> > local.conf I added LINUX_LIBC_HEADERS_VERSION = "2.6.37.2" but when I
>
> You need something like this:
>
>
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=61162abba3aa56057dfdfa8ae3a93c281aa2342a
>
> There's no standard variable LINUX_LIBC_HEADERS_VERSION for that, AFAIK.
>
>
Ah, thanks for the heads up.  I looked at my arago checkout and my
arago-prefs.inc didn't look like that but I see you just did that a few
days ago so I'll do a git pull and update my tree and study that to figure
out how it works.

So for my particular case, I'm guessing I need to do something similar
in oe-core/meta/conf/distro/include/default-providers.inc
& default-versions.inc?

Regards,

Brian

--001a11c2f80042231204e48e66b1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 22, 2013 at 2:54 PM, Denys Dmytriyenko <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; OK, I don&#39;t know if I did this right or not but now I have a<br>
&gt; <a href=3D"http://linux-libc-headers_2.6.37.2.bb" target=3D"_blank">li=
nux-libc-headers_2.6.37.2.bb</a> (from the web git link I mentioned before)=
<br>
&gt; file in my meta/recipes-kernel/linux-libc-headers directory. =A0In my<=
br>
&gt; local.conf I added LINUX_LIBC_HEADERS_VERSION =3D &quot;2.6.37.2&quot;=
 but when I<br>
<br>
</div>You need something like this:<br>
<br>
<a href=3D"http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;=
h=3D61162abba3aa56057dfdfa8ae3a93c281aa2342a" target=3D"_blank">http://arag=
o-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;h=3D61162abba3aa56057d=
fdfa8ae3a93c281aa2342a</a><br>

<br>
There&#39;s no standard variable LINUX_LIBC_HEADERS_VERSION for that, AFAIK=
.<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v><br></div><div>Ah, thanks for the heads up. =A0I looked at my arago check=
out and my arago-prefs.inc didn&#39;t look like that but I see you just did=
 that a few days ago so I&#39;ll do a git pull and update my tree and study=
 that to figure out how it works.=A0</div>
<div><br></div><div>So for my particular case, I&#39;m guessing I need to d=
o something similar in=A0oe-core/meta/conf/distro/include/default-providers=
.inc &amp;=A0default-versions.inc?</div><div><br></div><div>Regards,</div><=
div>
<br></div><div>Brian</div><div><br></div><div><br></div></div></div></div>

--001a11c2f80042231204e48e66b1--
