Return-Path: <exosyst@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1418BE0140C
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 10:15:07 -0700 (PDT)
Received: by pbbrq8 with SMTP id rq8so1796399pbb.35
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 10:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=x/72VM/12jzWU9WjKAboXKK5+masYeYrsYEU155V7Yg=;
	b=w8j7Ma3g92gABnEI6QcyZOfnJtFzhDE5zdaFC93P5ZTn1/AKzZfGDruqhTsRU0bgq5
	CtXOUTYqQdW8BmnvEcidQ/CAE6kVpk2y1d7WLVg/crrJ+SgE9JpoawBI6iOErgZOkI+G
	WQ7ykB1/ugRuyVCsoEbLSMDSqfwWRkjO8uMvFB6tHyK7bNZitW9+mnjL7LpDKRBXieh7
	1vmYFiKa9W47ToaH2joYa/MkzZKeeDE3cTK9emswTdcejGiHORsyJWgZfN6CjmOnZ1D3
	V/AWmD4vjdhHGx1Tb1YFA+UQGEnyCrT4FGg+o0gKtykg8dDPg0un0wIqiv8Jg6EBfmjx
	H0Fw==
Received: by 10.68.221.39 with SMTP id qb7mr18039523pbc.120.1337188506411;
	Wed, 16 May 2012 10:15:06 -0700 (PDT)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.68.204.162 with HTTP; Wed, 16 May 2012 10:14:46 -0700 (PDT)
In-Reply-To: <20120516171154.GM14763@denix.org>
References: <CAN-pQATO_EjYx2g5oM5Hja-FawTOy00wOBkDFEgutwaCRh1kxQ@mail.gmail.com>
	<CAN-pQAT-__u2-f6YiM307YeDUUeUOCOx9=AQ3+rZJBVU1sXSJA@mail.gmail.com>
	<CAMKF1sq1+NSzD3WWTVJLrxJDXuzkA_w9hO7r4WrTL1CFe3hD_Q@mail.gmail.com>
	<CAN-pQAS=L-VKUYqYRNqYHGOrhHf69KjZJ0PGFtFjJHccefHGng@mail.gmail.com>
	<CAMKF1sqiMSbf6+KSc-L5w7Aqeg2zbLB3xgKSf-CSPTn4iVug_Q@mail.gmail.com>
	<20120516171154.GM14763@denix.org>
From: Nick G <exosyst+metaTI@gmail.com>
Date: Wed, 16 May 2012 18:14:46 +0100
X-Google-Sender-Auth: k48DTxJX4kFaXe3A0gftkWlcNNQ
Message-ID: <CAN-pQATB49XchBM6bcLFxCNOwqTJUFL-Kw5EVROVmo=mBkyrCQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: Building issues with meta-toolchain on Beaglebone
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
X-List-Received-Date: Wed, 16 May 2012 17:15:07 -0000
Content-Type: multipart/alternative; boundary=e89a8ff25688ec23a904c02a753d

--e89a8ff25688ec23a904c02a753d
Content-Type: text/plain; charset=ISO-8859-1

Heya,

I can no longer reproduce as I'm working from git but I did have
denzil-poky-0.7 from tarball and then meta-oe set to track the denzil
branch. I did a build of meta-toolchain which is when it threw up.

Regards,
Nick

On 16 May 2012 18:11, Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, May 16, 2012 at 09:57:29AM -0700, Khem Raj wrote:
> > On Wed, May 16, 2012 at 9:32 AM, Nick G <exosyst+metaTI@gmail.com>
> wrote:
> > >
> /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/limits.h:169:61:
> > > error: no include path in which to search for limits.h
> >
> > this is the error. I have seen this error in past look for patches in
> > master against
> > gcc recipes where this might be fixed.
>
> include-fixed/limits.h is many years old issue! I remember fixing it at
> least
> 4 years ago. I'm surprised it still happens these days... :)
>
> What is the way to reproduce it?
>
> --
> Denys
>

--e89a8ff25688ec23a904c02a753d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Heya,<br><br>I can no longer reproduce as I&#39;m working from git but I di=
d have denzil-poky-0.7 from tarball and then meta-oe set to track the denzi=
l branch. I did a build of meta-toolchain which is when it threw up.<br>

<br>Regards,<br>Nick<br><br><div class=3D"gmail_quote">On 16 May 2012 18:11=
, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org=
" target=3D"_blank">denis@denix.org</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Wed, May 16, 2012 at 09:57:29AM =
-0700, Khem Raj wrote:<br>
&gt; On Wed, May 16, 2012 at 9:32 AM, Nick G &lt;<a href=3D"mailto:exosyst%=
2BmetaTI@gmail.com">exosyst+metaTI@gmail.com</a>&gt; wrote:<br>
&gt; &gt; /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux=
/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.=
4/include-fixed/limits.h:169:61:<br>
&gt; &gt; error: no include path in which to search for limits.h<br>
&gt;<br>
&gt; this is the error. I have seen this error in past look for patches in<=
br>
&gt; master against<br>
&gt; gcc recipes where this might be fixed.<br>
<br>
</div></div>include-fixed/limits.h is many years old issue! I remember fixi=
ng it at least<br>
4 years ago. I&#39;m surprised it still happens these days... :)<br>
<br>
What is the way to reproduce it?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br>

--e89a8ff25688ec23a904c02a753d--
