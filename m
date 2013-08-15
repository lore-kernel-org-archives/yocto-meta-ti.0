Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7A27E0043E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 09:26:00 -0700 (PDT)
Received: by mail-la0-f48.google.com with SMTP id er20so711902lab.21
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=D5EhNTj0tjUpz/F9foxt1OXDkruhLazLATmMVpt9jtk=;
	b=u8MnHEoMdp2wySRys8HzVvo8DbiFFnZ77qW50Qog2tbEU5GcULFeXh5lrUOhf3z5h4
	FJBRICvPuDZYTJgN0mtP5jC9qPIJQxVcVP+J9Qzvqr/9VxYk22s070wuTARxKmQ64I+D
	p4tHxk62wKQXN1kQnhvYZTTvZ4gK2hKVt37Y2EJCOsBxLwYuLCqLwOdgFaH8Mj8nXMeC
	zUA9M0ADtpdAromPYKl0KYF4JRf85kgyKizm4n/U/9yl+XVfg8tnf1+ufMf2zjhYXH4G
	do1xAbPdUgRO8OT5A8qRpSXuyLl8WapgdltkxzezLD1FdgzYLu7E4Ut8BCpGls8vvyGz
	wWxw==
X-Received: by 10.152.2.201 with SMTP id 9mr13981785law.20.1376583958713; Thu,
	15 Aug 2013 09:25:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Thu, 15 Aug 2013 09:25:38 -0700 (PDT)
In-Reply-To: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 15 Aug 2013 09:25:38 -0700
X-Google-Sender-Auth: R5LopIHsJinqeiN6rD76-CtZJYg
Message-ID: <CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
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
X-List-Received-Date: Thu, 15 Aug 2013 16:26:05 -0000
Content-Type: multipart/alternative; boundary=089e013c6760dcdd7104e3feed1c

--089e013c6760dcdd7104e3feed1c
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 15, 2013 at 8:52 AM, Brian Hutchinson <b.hutchman@gmail.com>wrote:

> I have a custom TI816x board that uses a modified kernel from the TI PSP.
>  Kernel is of the 2.6.37 flavor.  I'm trying to migrate to OE Core
> environment and I'm having trouble with getting the kernel to work.
>
> With the toolchain in denzil (gcc version 4.6.4 20120303), kernel will at
> least boot but will die with:
>
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000002
> pgd = c0004000
> [00000002] *pgd=00000000
> Internal error: Oops: 5 [#1]
>
> Any of the more modern toolchains (poky/meta-ti master or Linaro
> (gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux) are used, the kernel
> won't even make a peep ... nothing is displayed.
>

I haven't seen the panic, but I have seen a complete silent boot hang when
moving from 4.6 to 4.7 or 4.8 on my OMAP5 EVM board. The gcc-linaro
toolchain worked, as did a 2012.03 sourcery toolchain, but neither the
2013.05 toolchain nor the internal built yocto toolchain from 1.5/master
resulted in a successful boot. I got past that issue by cherry picking
these two commits from a more recent kernel:

455bd4c430b0c0a361f38e8658a0d6cb469942b5 - ARM: 7668/1: fix memset-related
crashes caused by recent GCC (4.7.2) optimizations
418df63adac56841ef6b0f1fcf435bc64d4ed177 - ARM: 7670/1: fix the memset fix

See also
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39864

Presumably you may need more than just that since you're also hitting a
panic with 4.6, but it may be worth trying those as a starting point. Good
luck!
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c6760dcdd7104e3feed1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 15, 2013 at 8:52 AM, Brian Hutchinson <span dir=3D"ltr">&lt;<a =
href=3D"mailto:b.hutchman@gmail.com" target=3D"_blank">b.hutchman@gmail.com=
</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>I have a custom TI816x board that uses a modified ker=
nel from the TI PSP. =C2=A0Kernel is of the 2.6.37 flavor. =C2=A0I&#39;m tr=
ying to migrate to OE Core environment and I&#39;m having trouble with gett=
ing the kernel to work.</div>



<div><br></div><div>With the toolchain in denzil (gcc version 4.6.4 2012030=
3), kernel will at least boot but will die with:</div><div><br></div><div><=
div>Unable to handle kernel NULL pointer dereference at virtual address 000=
00002</div>



<div>pgd =3D c0004000</div><div>[00000002] *pgd=3D00000000</div><div>Intern=
al error: Oops: 5 [#1]</div></div><div><br></div><div>Any of the more moder=
n toolchains (poky/meta-ti master or Linaro (gcc-linaro-arm-linux-gnueabihf=
-4.8-2013.07-1_linux) are used, the kernel won&#39;t even make a peep ... n=
othing is displayed.</div>


</blockquote></div><br>I haven&#39;t seen the panic, but I have seen a comp=
lete silent boot hang when moving from 4.6 to 4.7 or 4.8 on my OMAP5 EVM bo=
ard. The gcc-linaro toolchain worked, as did a 2012.03 sourcery toolchain, =
but neither the 2013.05 toolchain nor the internal built yocto toolchain fr=
om 1.5/master resulted in a successful boot. I got past that issue by cherr=
y picking these two commits from a more recent kernel:</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">455bd4c430b=
0c0a361f38e8658a0d6cb469942b5 -=C2=A0ARM: 7668/1: fix memset-related crashe=
s caused by recent GCC (4.7.2) optimizations</div><div class=3D"gmail_extra=
">418df63adac56841ef6b0f1fcf435bc64d4ed177 -=C2=A0ARM: 7670/1: fix the mems=
et fix<br>

</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style=
>See also=C2=A0<a href=3D"http://comments.gmane.org/gmane.comp.handhelds.op=
enembedded.core/39864">http://comments.gmane.org/gmane.comp.handhelds.opene=
mbedded.core/39864</a></div>


<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Presumably =
you may need more than just that since you&#39;re also hitting a panic with=
 4.6, but it may be worth trying those as a starting point. Good luck!<br>

-- <br>
Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics
</div></div>

--089e013c6760dcdd7104e3feed1c--
