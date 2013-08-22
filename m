Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDDE0E00406
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 11:41:22 -0700 (PDT)
Received: by mail-ob0-f169.google.com with SMTP id wc20so4452468obb.28
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 11:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eW6FeCXt4kOcHLYTX9ZuzSemAURVejEQql/Bg/wqxxs=;
	b=M7Jb1q5JD6uIRlNEXEfCJytNnx7oTfAXESOSxF6yAXJShQ7IYDD54nBppxeu7J6QQR
	I1VvBu3/fSFSIPCp4UU4oyqJNIElRF5W6mqznwGbksBBG9PF74g0Af5xDD+wGkm2S4Dy
	+bUuZDc6nZfJzA68CFZ73Efeblm0Cdz+EzmMVrf3lk2dkNW0sj2rJbleF2Bu60jbjPFK
	SidU+O/yC90A0lsnNDArGNs+IPTMJVHe1wzOzzoMcEe+d6TKIjCwyI76lmNBrobxZ2SP
	nHKK9iHj1LQdXBONuha+C5gz6jdTwYxKZug/BAd4PrKkIv6iFVY4MpmJ4bvmAoiUUIH0
	j/HQ==
MIME-Version: 1.0
X-Received: by 10.182.220.199 with SMTP id py7mr3029322obc.92.1377196878009;
	Thu, 22 Aug 2013 11:41:18 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 22 Aug 2013 11:41:17 -0700 (PDT)
In-Reply-To: <CAFZh4h9Ru3iED9ASmxqs14Pve+foh3gg15OBnVtfNR-B_b1rMQ@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
	<20130822024616.GA25063@edge>
	<CAFZh4h9Ru3iED9ASmxqs14Pve+foh3gg15OBnVtfNR-B_b1rMQ@mail.gmail.com>
Date: Thu, 22 Aug 2013 14:41:17 -0400
Message-ID: <CAFZh4h8avM4+=5zDuB_6N4bJL5jLKaUPSi8VK66d1+NunaZx+w@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Aug 2013 18:41:25 -0000
Content-Type: multipart/alternative; boundary=001a11c334aab31b4b04e48da21f

--001a11c334aab31b4b04e48da21f
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 11:23 AM, Brian Hutchinson <b.hutchman@gmail.com>wrote:

> On Wed, Aug 21, 2013 at 10:46 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
>>
>>
>> Well, if you use Dylan (or even Danny), it has a recipe already available
>> in
>> oe-core...
>>
>>
> Yes, I found this one that Khem added checksums to and used web git to
> cherry pick it out:
>
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb?h=dylan&id=370e082c8bbf14c9b0f54269eb99d291d187cd40
>
>
>
OK, I don't know if I did this right or not but now I have a
linux-libc-headers_2.6.37.2.bb (from the web git link I mentioned before)
file in my meta/recipes-kernel/linux-libc-headers directory.  In my
local.conf I added LINUX_LIBC_HEADERS_VERSION = "2.6.37.2" but when I
bitbake core-image-minimal it doesn't look like it is rebuilding everything
with the headers I specified.  If I look
in build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers
all I see is 3.8-r0 so it doesn't look like it grabbed the 2.6.37 headers.

Did I go about this the wrong way?  I tried a bitbake -c cleanall
core-image-minimal and that didn't appear to kick it in the pants and make
it build everything over again with the new headers.

Regards,

Brian

--001a11c334aab31b4b04e48da21f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 22, 2013 at 11:23 AM, Brian Hutchinson <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" target=3D"_blank">b.=
hutchman@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"im">On Wed, Aug 21, 2013 at=
 10:46 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@=
ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br>
</div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D"i=
m"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex">

<div><br>
<br>
</div>Well, if you use Dylan (or even Danny), it has a recipe already avail=
able in<br>
oe-core...<br>
<div><div><br></div></div></blockquote><div><br></div></div><div>Yes, I fou=
nd this one that Khem added checksums to and used web git to cherry pick it=
 out:</div><div><a href=3D"http://cgit.openembedded.org/openembedded-core/c=
ommit/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb=
?h=3Ddylan&amp;id=3D370e082c8bbf14c9b0f54269eb99d291d187cd40" target=3D"_bl=
ank">http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-ker=
nel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb?h=3Ddylan&amp;id=3D37=
0e082c8bbf14c9b0f54269eb99d291d187cd40</a><br>

</div><div><br></div><div><br></div></div></div></div></blockquote><div>=A0=
</div><div>OK, I don&#39;t know if I did this right or not but now I have a=
 <a href=3D"http://linux-libc-headers_2.6.37.2.bb">linux-libc-headers_2.6.3=
7.2.bb</a> (from the web git link I mentioned before) file in my meta/recip=
es-kernel/linux-libc-headers directory. =A0In my local.conf I added=A0LINUX=
_LIBC_HEADERS_VERSION =3D &quot;2.6.37.2&quot; but when I bitbake core-imag=
e-minimal it doesn&#39;t look like it is rebuilding everything with the hea=
ders I specified. =A0If I look in=A0build/tmp-eglibc/work/armv7a-vfp-neon-o=
e-linux-gnueabi/linux-libc-headers all I see is=A03.8-r0 so it doesn&#39;t =
look like it grabbed the 2.6.37 headers.</div>
<div><br></div><div>Did I go about this the wrong way? =A0I tried a bitbake=
 -c cleanall core-image-minimal and that didn&#39;t appear to kick it in th=
e pants and make it build everything over again with the new headers.</div>
<div><br></div><div>Regards,</div><div><br></div><div>Brian</div></div></di=
v></div>

--001a11c334aab31b4b04e48da21f--
