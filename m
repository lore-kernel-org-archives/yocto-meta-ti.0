Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 583BEE004DD; Fri, 15 Aug 2014 02:47:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5D4AE0034B
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 02:47:33 -0700 (PDT)
Received: by mail-qg0-f44.google.com with SMTP id e89so2054809qgf.3
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 02:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s309JkTqvFVa6h/RkcdkL7EGgicSIhWyp2CZOgJ32IM=;
	b=ViMABCLtH/bns4RFHX8Qvzbt6q08TMsqJlCUapC4zaIZNPuhlZGhyCp5s+dafPgdbH
	KBsog/LCTH+CM0xHglB5zrsHUhUVceePj0mto3CSfWeaboelmHoADg8Faap3HVAm1cVJ
	jnLlPDFKT/OGq9wepk8JL33PJEbuTGY85ZrNWOeTs0KDrEhzE9/0/paEH46JsjvOKpq8
	MsPypbd8EYwZE5cR8vHJ31jONzgtiY0ybaqQ+J3ljvhZC4qCyEhPN1SBbq3iDv7fXhma
	prHP8v0k01SbGmzFYtNpkSps0I2jZ4GO8amxNSFPXwi6sGISalJBYpcy/Ib4XHBx5qgX
	Nb9A==
X-Received: by 10.140.34.174 with SMTP id l43mr24590488qgl.105.1408096052476; 
	Fri, 15 Aug 2014 02:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Fri, 15 Aug 2014 02:47:12 -0700 (PDT)
In-Reply-To: <20140814202056.GY23523@edge>
References: <53ED13BE.2090809@pseudoterminal.org> <20140814200450.GX23523@edge>
	<53ED175D.2090502@pseudoterminal.org> <20140814202056.GY23523@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 15 Aug 2014 06:47:12 -0300
Message-ID: <CAMCfZKFjnbxbMcEXwesGxDp1r88aSn_JgY33c0YVR0hv0K18Cw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Fri, 15 Aug 2014 09:47:37 -0000
Content-Type: multipart/alternative; boundary=001a11c0451c0484570500a7e963

--001a11c0451c0484570500a7e963
Content-Type: text/plain; charset=ISO-8859-1

Carlos,

On Thu, Aug 14, 2014 at 5:20 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Thu, Aug 14, 2014 at 10:09:01PM +0200, Carlos Rafael Giani wrote:
> > On 08/14/2014 10:04 PM, Denys Dmytriyenko wrote:
> > >On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrote:
> > >>Hello,
> > >>
> > >>after building a rootfs for the Beaglebone Black, I see the
> > >>following files in the deploy folder for the machine:
> > >>
> > >>MLO
> > >>u-boot.img
> > >>u-boot-spl.bin
> > >>zImage
> > >>
> > >>as well as other symlinks with "-beaglebone" attached to their
> filenames.
> > >>
> > >>What should I copy, the SPL bin, or the .img u-boot binary?
> > >>Also, u-boot tries to load a uImage, even though a zImage was built.
> > >>There is also no uEnv.txt file.
> > >>Do I have to write one to be able to let u-boot load the zImage, or
> > >>should it work out-of-the-box?
> > >Depends on the rootfs image you are building. Most images that are
> based on
> > >core-image-base will take care of deploying necessary pieces into the
> rootfs.
> > >But core-image-minimal is special and very bare-bone, so extra manual
> steps
> > >are required.
> > >
> > >Regardless of the rootfs image, you'd need MLO and u-boot.img to be
> located in
> > >the first FAT partition of your SD card or eMMC flash.
> > >
> > >Then, if your rootfs does not already have zImage and the necessary DTB
> files
> > >in the /boot directory, you have to place them there (i.e.
> core-image-minimal)
> > >and you are ready to boot. All the defaults will work for
> out-of-the-box in
> > >this case. No uEnv.txt is necessary, unless you need to do something
> extra
> > >special...
> > >
> >
> > Oh, I just built core-image-base .
> >
> > So I should use the .img and not the SPL .bin? I was wondering if
> > the SPL bin is a newer binary that will eventually replace the .img
> > one.
> >
> > But when I use the .img file, it turns out that it tries to load a
> > uImage, even though a zImage was built. Simply setting the bootfile
> > env var to "zImage" won't work, because the u-boot script will try
> > to boot with the incorrect command.
> >
> > I am trying to rule out that something went wrong in my build, that
> > something is wrong in my setup. If I build core-image-base , the
> > resulting u-boot.img should automatically load a zImage, not a
> > uImage, correct?
>
> u-boot-spl.bin, while named weird, is a special SPL binary (i.e. MLO) for
> UART
> booting - loading u-boot and the rest over serial. They are similar in
> sizes
> with MLO...
>
> The real u-boot.img should boot zImage by default - make sure you are
> building
> the correct one from meta-ti. The one named u-boot-ti-staging is preferred,
> but u-boot_2014.07 should also be fine.


Here you have some instructions on how to "cook" an sdcard for beaglebone
black:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/README.hardware

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c0451c0484570500a7e963
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Carlos,</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Thu, Aug 14, 2014 at 5:20 PM, De=
nys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D""><div class=3D"">On Thu, Aug 14, 2014 at 10=
:09:01PM +0200, Carlos Rafael Giani wrote:<br>


&gt; On 08/14/2014 10:04 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt;On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrot=
e:<br>
&gt; &gt;&gt;Hello,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;after building a rootfs for the Beaglebone Black, I see the<br=
>
&gt; &gt;&gt;following files in the deploy folder for the machine:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;MLO<br>
&gt; &gt;&gt;u-boot.img<br>
&gt; &gt;&gt;u-boot-spl.bin<br>
&gt; &gt;&gt;zImage<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;as well as other symlinks with &quot;-beaglebone&quot; attache=
d to their filenames.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;What should I copy, the SPL bin, or the .img u-boot binary?<br=
>
&gt; &gt;&gt;Also, u-boot tries to load a uImage, even though a zImage was =
built.<br>
&gt; &gt;&gt;There is also no uEnv.txt file.<br>
&gt; &gt;&gt;Do I have to write one to be able to let u-boot load the zImag=
e, or<br>
&gt; &gt;&gt;should it work out-of-the-box?<br>
&gt; &gt;Depends on the rootfs image you are building. Most images that are=
 based on<br>
&gt; &gt;core-image-base will take care of deploying necessary pieces into =
the rootfs.<br>
&gt; &gt;But core-image-minimal is special and very bare-bone, so extra man=
ual steps<br>
&gt; &gt;are required.<br>
&gt; &gt;<br>
&gt; &gt;Regardless of the rootfs image, you&#39;d need MLO and u-boot.img =
to be located in<br>
&gt; &gt;the first FAT partition of your SD card or eMMC flash.<br>
&gt; &gt;<br>
&gt; &gt;Then, if your rootfs does not already have zImage and the necessar=
y DTB files<br>
&gt; &gt;in the /boot directory, you have to place them there (i.e. core-im=
age-minimal)<br>
&gt; &gt;and you are ready to boot. All the defaults will work for out-of-t=
he-box in<br>
&gt; &gt;this case. No uEnv.txt is necessary, unless you need to do somethi=
ng extra<br>
&gt; &gt;special...<br>
&gt; &gt;<br>
&gt;<br>
&gt; Oh, I just built core-image-base .<br>
&gt;<br>
&gt; So I should use the .img and not the SPL .bin? I was wondering if<br>
&gt; the SPL bin is a newer binary that will eventually replace the .img<br=
>
&gt; one.<br>
&gt;<br>
&gt; But when I use the .img file, it turns out that it tries to load a<br>
&gt; uImage, even though a zImage was built. Simply setting the bootfile<br=
>
&gt; env var to &quot;zImage&quot; won&#39;t work, because the u-boot scrip=
t will try<br>
&gt; to boot with the incorrect command.<br>
&gt;<br>
&gt; I am trying to rule out that something went wrong in my build, that<br=
>
&gt; something is wrong in my setup. If I build core-image-base , the<br>
&gt; resulting u-boot.img should automatically load a zImage, not a<br>
&gt; uImage, correct?<br>
<br>
</div></div>u-boot-spl.bin, while named weird, is a special SPL binary (i.e=
. MLO) for UART<br>
booting - loading u-boot and the rest over serial. They are similar in size=
s<br>
with MLO...<br>
<br>
The real u-boot.img should boot zImage by default - make sure you are build=
ing<br>
the correct one from meta-ti. The one named u-boot-ti-staging is preferred,=
<br>
but u-boot_2014.07 should also be fine.</blockquote></div><br>Here you have=
 some instructions on how to &quot;cook&quot; an sdcard for beaglebone blac=
k:</div><div class=3D"gmail_extra"><a href=3D"http://git.yoctoproject.org/c=
git/cgit.cgi/poky/tree/README.hardware">http://git.yoctoproject.org/cgit/cg=
it.cgi/poky/tree/README.hardware</a><br>

<br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>-=
-<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"h=
ttp://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=
=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">=
www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c0451c0484570500a7e963--
