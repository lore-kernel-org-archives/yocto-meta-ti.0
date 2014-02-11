Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FB51E00475
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 09:15:18 -0800 (PST)
Received: by mail-qa0-f54.google.com with SMTP id i13so12185274qae.27
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 09:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jhodBqh4uyeFCs+fUHpS2YgNnVV2mbu72JDKhc6pVLM=;
	b=VqWppSOEVh2DZdTLsj6uI14x7NOe95BxZZiehrD7Jh1adWWmmFExFhW8CijN3ZIUdm
	IkYlANJyBxzodXRlA05At26IDW1c3zeQoRsW+cJe5jS/Y5MQBfWfVxA3phag554SDs1n
	Z6gXZO2PB9qZAQTS7ebAJQtcT5tHQuFzZDeBMC6HU/e4+TnNN21sQweFcNxXZHqCLJaW
	61kYdwfVfLKSkPHquKNMdaLWpoqKHfEh5TdUwA2XEmfIqUaSXRLI4hIQfgUPYQWg3cpA
	I26+q5oUHSZZy+yGNpS8SvBl7RQsZAlyd8nSkfp3fldNPbjERcoY0z+S1wh0r2hHL2B+
	8Okg==
X-Received: by 10.224.75.73 with SMTP id x9mr60158561qaj.36.1392138917906;
	Tue, 11 Feb 2014 09:15:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 09:14:57 -0800 (PST)
In-Reply-To: <CAEaGWUJAg_OuSLwy9rBy3q5VjRiO9UrA1zNdnKqG_f7=UDYY0w@mail.gmail.com>
References: <CAEaGWUJAg_OuSLwy9rBy3q5VjRiO9UrA1zNdnKqG_f7=UDYY0w@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 15:14:57 -0200
Message-ID: <CAMCfZKHrfLX7C22ZkUKUMyXhe0+nmHRzwPwmUD1C9LD-W-dj4g@mail.gmail.com>
To: Fabio Berton <fbberton@gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Cape manager Beaglebone Black
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
X-List-Received-Date: Tue, 11 Feb 2014 17:15:21 -0000
Content-Type: multipart/alternative; boundary=001a11c30308ae12b204f224993f

--001a11c30308ae12b204f224993f
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 2:50 PM, Fabio Berton <fbberton@gmail.com> wrote:

> Hi!
> I created an image with Yocto to my beaglebone black and the image doens't
> created /sys/device/bone_capemgr.*/ directory. So, I can't enable the LCD
> 7" cape. How can I enable the cape support?
>

Try to put IMAGE_INSTALL += "kernel-modules" on your image recipe.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a11c30308ae12b204f224993f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 11, 2014 at 2:50 PM, Fabio Berton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fbberton@gmail.com" target=3D"_blank">fbberton@gmail.com</a>&gt;=
</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi!<div>I created an image =
with Yocto to my beaglebone black and the image doens&#39;t created /sys/de=
vice/bone_capemgr.*/ directory. So, I can&#39;t enable the LCD 7&quot; cape=
. How can I enable the cape support?</div>

</div></blockquote></div><br>Try to put IMAGE_INSTALL +=3D &quot;kernel-mod=
ules&quot; on your image recipe.</div><div class=3D"gmail_extra"><br><br cl=
ear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*=
dS<br>

Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://www.em=
barcados.com.br" target=3D"_blank">www.embarcados.com.br</a><br><br>/*long =
live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c30308ae12b204f224993f--
