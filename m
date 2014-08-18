Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2465FE007F1; Mon, 18 Aug 2014 03:32:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.177 listed in list.dnswl.org]
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD538E007EE
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 03:32:13 -0700 (PDT)
Received: by mail-qc0-f177.google.com with SMTP id x13so4541134qcv.8
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VIzqqMxAC+AHixp8h6Yd2QeEhNPGnDZgsCHTKVH0TaQ=;
	b=ErrL21JXetDz8la0YYwzIGI6jOIl3ULWnFUUkrVob2UH165jEspgIzBRaPlkcizMnm
	blEqT8tdQSpEfUU/JWSWst2HYTHvU2MwMq4owVn+nJGCzAt8Q4NBkoethFEVOQuiz6rd
	KxfPX8fMvL3sCCE2hjnP61V/x0Tx8FZSFA5Vp+KobrJxFoJNKCQfSpzNEJK0RvGU6kQj
	mLoIIi6FJXcTXTvRx1PWx17HJFcoG9ugDVr/ZZe2dnBFAnpTBB50Jz16QLAVjjhgJLYL
	yjWxICoiC84rquv+XDSbkiRQM8zrzd7fLY4sn9d1X4zcD5KjqGaPXsxbI/J4VVc47WQb
	1XcQ==
X-Received: by 10.224.129.68 with SMTP id n4mr53029842qas.86.1408357931890;
	Mon, 18 Aug 2014 03:32:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Mon, 18 Aug 2014 03:31:51 -0700 (PDT)
In-Reply-To: <53F1C2F5.50209@pseudoterminal.org>
References: <53ED13BE.2090809@pseudoterminal.org> <20140814200450.GX23523@edge>
	<53ED175D.2090502@pseudoterminal.org>
	<2948184.BeJYLBqp38@localhost.localdomain>
	<53F1C2F5.50209@pseudoterminal.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 18 Aug 2014 07:31:51 -0300
Message-ID: <CAMCfZKHNqZvUm47ks_GtJFF_nHO5duM9PLNqXZ=bdBkSkhep0Q@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
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
X-List-Received-Date: Mon, 18 Aug 2014 10:32:18 -0000
Content-Type: multipart/alternative; boundary=001a11c2bac43f43080500e4e287

--001a11c2bac43f43080500e4e287
Content-Type: text/plain; charset=ISO-8859-1

Carlos,

On Mon, Aug 18, 2014 at 6:10 AM, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> I rebuilt the image, with the proper layers, but still I get an incorrect
> u-boot environment. Full u-boot serial output and boot log follow below.
> uname -a prints:  Linux beaglebone 3.14.16 #1 Thu Aug 14 18:00:21 CEST
> 2014 armv7l GNU/Linux
> (the kernel was built by the linux-ti-staging recipe)
>
> The u-boot problem bootfile is set to uImage, and mmcboot uses bootm
> instead of bootz.
>

Your u-boot (2013.04-rc1-14237-g90639fe-dirty) is not the one provided for
meta-ti (2014.07).
Issue these commands:

bitbake virtual/bootloader -ccleansstate
bitbake virtual/bootloader -f




>
> Furthermore, once I correct these two values, it boots, but I see this
> eventually:
>
>   Error opening /dev/fb0: No such file or directory
>
> After a bit of investigation, it turned out that omaplfb wasn't loading
> due to missing symbols:
>
>   root@beaglebone:~# modprobe omaplfb
>   [   83.010309] omaplfb: Unknown symbol register_vsync_cb (err 0)
>   [   83.016642] omaplfb: Unknown symbol unregister_vsync_cb (err 0)
>
> Searching for this, I found
> https://groups.google.com/forum/#!topic/beagleboard/dcLtpK7ZsX0 .
> According to this, in the kernel log, I should set CONFIG_FB_DA8XX to "y".
> Is this still correct for linux-ti-staging 3.14.16 ?
>

To use DRM driver you should set:

CONFIG_DRM=y
CONFIG_DRM_I2C_NXP_TDA998X=y
CONFIG_DRM_TILCDC=y

To use de FB driver:

CONFIG_FB_DA8XX=y
CONFIG_FB_DA8XX_TDA998X=y


Here is a reference:
http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User_Guide


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c2bac43f43080500e4e287
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Carlos,</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Mon, Aug 18, 2014 at 6:10 AM, Ca=
rlos Rafael Giani <span dir=3D"ltr">&lt;<a href=3D"mailto:dv@pseudoterminal=
.org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF">I rebuilt the im=
age, with the proper layers, but still I get an
    incorrect u-boot environment. Full u-boot serial output and boot log
    follow below.<br>
    uname -a prints:=A0 Linux beaglebone <span><span>3.14.16</span></span> =
#1 Thu Aug 14 18:00:21
    CEST 2014 armv7l GNU/Linux<br>
    (the kernel was built by the linux-ti-staging recipe)<br>
    <br>
    The u-boot problem bootfile is set to uImage, and mmcboot uses bootm
    instead of bootz.<br></div></blockquote><div><br></div><div>Your u-boot=
 (<span style=3D"font-size:13px;font-family:arial,sans-serif">2013.04-rc1-1=
4237-g90639fe-</span><span style=3D"font-size:13px;font-family:arial,sans-s=
erif">dirty)</span>=A0is not the one provided for meta-ti (2014.07).</div>

<div>Issue these commands:</div></div></div><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px"><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><div>bitbake virtual/bootloader -ccleansstate<br></div><d=
iv>

bitbake virtual/bootloader -f<br></div></div></div></blockquote><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><div><br></div><div>=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pad=
ding-left:1ex">

<div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    Furthermore, once I correct these two values, it boots, but I see
    this eventually:<br>
    <br>
    =A0 Error opening /dev/fb0: No such file or directory<br>
    <br>
    After a bit of investigation, it turned out that omaplfb wasn&#39;t
    loading due to missing symbols:<br>
    <br>
    =A0 root@beaglebone:~# modprobe omaplfb<br>
    =A0 [=A0=A0 83.010309] omaplfb: Unknown symbol register_vsync_cb (err 0=
)<br>
    =A0 [=A0=A0 83.016642] omaplfb: Unknown symbol unregister_vsync_cb (err=
 0)<br>
    <br>
    Searching for this, I found
    <a href=3D"https://groups.google.com/forum/#!topic/beagleboard/dcLtpK7Z=
sX0" target=3D"_blank">https://groups.google.com/forum/#!topic/beagleboard/=
dcLtpK7ZsX0</a> .
    According to this, in the kernel log, I should set
   =20
    CONFIG_FB_DA8XX to &quot;y&quot;. Is this still correct for linux-ti-st=
aging
    <span><span>3.14.16</span></span> ?</div></blockquote></div><div class=
=3D"gmail_extra"><br></div>To use DRM driver you should set:</div><div clas=
s=3D"gmail_extra"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;=
padding:0px">

<div class=3D"gmail_extra"><div class=3D"gmail_extra">CONFIG_DRM=3Dy</div><=
div class=3D"gmail_extra">CONFIG_DRM_I2C_NXP_TDA998X=3Dy</div><div class=3D=
"gmail_extra">CONFIG_DRM_TILCDC=3Dy</div><div class=3D"gmail_extra"><br></d=
iv></div></blockquote>

To use de FB driver:</div><div class=3D"gmail_extra"><blockquote style=3D"m=
argin:0px 0px 0px 40px;border:none;padding:0px"><div class=3D"gmail_extra">=
<div class=3D"gmail_extra">CONFIG_FB_DA8XX=3Dy</div><div class=3D"gmail_ext=
ra">CONFIG_FB_DA8XX_TDA998X=3Dy</div>

</div></blockquote><blockquote style=3D"margin:0px 0px 0px 40px;border:none=
;padding:0px"><div class=3D"gmail_extra"><div><br></div></div></blockquote>=
</div><div class=3D"gmail_extra">Here is a reference:</div><div class=3D"gm=
ail_extra">

<a href=3D"http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controlle=
r_User_Guide">http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Contro=
ller_User_Guide</a><br><br><br clear=3D"all"><div><div dir=3D"ltr"><div>Reg=
ards,</div>

<div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados=
<br>
<a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;=
utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=
=3D"_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/=
<br></div>


</div>
</div></div>

--001a11c2bac43f43080500e4e287--
