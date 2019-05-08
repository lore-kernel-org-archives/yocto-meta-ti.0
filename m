Return-Path: <ashish.emailaddress@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E8D5E00D43; Wed,  8 May 2019 08:17:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ashish.emailaddress[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.196 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40E77E00CDF;
	Wed,  8 May 2019 08:17:39 -0700 (PDT)
Received: by mail-it1-f196.google.com with SMTP id g71so4501030ita.5;
	Wed, 08 May 2019 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oLmv/WSsFRSv9rZqJvHQotUn7svzuyHr2X2h2omo2II=;
	b=TO26zpQvwfHrsY6c1NRqYXV1qV+ISsmEUseCX5D2grrXfMjAbVfcVNZs90nkhKv5jb
	LZfxAdNVLz0ja+ko4i8di92YsVyjxOKfjyXN7NMwcO3iq/b83k+9w/nqlAK7xiGcVwCZ
	hkWLkgtKkNxZFyCq4A9xAUfaaPh9gJ+ySOvL4PrRHB+XFV44DAYiZ8IuQCi0aVX/iBiR
	t+FEW/HCEgFLRUI9tMuSLnoXXrYFxZ1CCyzg2TmEceieiwtuu41wKLo+y/VWZQBg6cI4
	RKqWIqlQTRJ0sXLS5u4sdJ9OOFk+gfugH9kAczOdADd1+dCGpTIsNkDK6CbqV33rrwc4
	FV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oLmv/WSsFRSv9rZqJvHQotUn7svzuyHr2X2h2omo2II=;
	b=lqhEhVUqEduB1KAVD619TZR2LY0U0lVnMCUJbOZxMGXa0oWNe1dOoXoX4uq3i1uEd8
	5TsGquHrYkAEMKKkeQoXTXpuL8r7pMMezMe4ho2S0LUeobtwMMTXTAtFlBtL1GQz1p+P
	CYtjsACzeW763pJJ8xNIWPPHA/4HNRdjySVAohJMTodYYtW0ICazVpL0H/5+eTGGeClp
	IZ1hb+MyyN9jDLdqothNdv0qeMrRQTH2ffLi7DBLBBUpl5aoz0mP85rMKYmWcLYF0hrs
	pVPV9xZpfQoVFVt3MlysMgQIKvSLpzfBLe9mzUhxbqLvG/jHDlJ0JqR03cU2qwiJ3IZL
	CshQ==
X-Gm-Message-State: APjAAAVc92529BdwpSrhDujmmFrc8ahVKEDD/s9TAaTRpLGuBdZQIAsa
	rC5qvmwWnjwbvrdjhoE6bCGum0C5BHfzdoM8/O8=
X-Google-Smtp-Source: APXvYqy16cCxYYrHl0oH8c7RouTTz3hy9JEjvLLW3sEA2dSCmkmfo79MMCNaFKVHE42sM1/J2JxBdW1Gd3oU0KgeL4I=
X-Received: by 2002:a05:660c:443:: with SMTP id
	d3mr4045993itl.147.1557328658647; 
	Wed, 08 May 2019 08:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAOe0dAV0D78sfX7W_Ge-5be8oo+W47knZAWUoTbeojqa-ezTaQ@mail.gmail.com>
	<CAOCHtYhu+Fkvvi4zADPWXoYcfUQF1GQ--SXNtdOOWqo0Xp_0Sg@mail.gmail.com>
	<20190507171421.GC1678@beryl>
In-Reply-To: <20190507171421.GC1678@beryl>
From: AshishKumar Mishra <ashish.emailaddress@gmail.com>
Date: Wed, 8 May 2019 20:47:27 +0530
Message-ID: <CAOe0dAWW5eHUEKvpjecM_uie5A74VbjixFX7AmzV=L5J8NU4ow@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org, linux-yocto@yoctoproject.org
Subject: Re: Meta-yocto-bsp fails to boot with META-TI [ Yocto-2.6.1]
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
X-List-Received-Date: Wed, 08 May 2019 15:17:40 -0000
Content-Type: multipart/alternative; boundary="0000000000007f51e4058861d559"

--0000000000007f51e4058861d559
Content-Type: text/plain; charset="UTF-8"

HI Denys / Robert ,

Thanks , got the board boot up now.
Followed below mentioned steps ( just in case if any one face similar
problem )

1) Erase the MMC
    => mmc dev 1
    => mmc erase 0 512

2) Install TFTP server on host
https://askubuntu.com/questions/201505/how-do-i-install-and-run-a-tftp-server

3) Transfer the dtb & zImage
=> setenv gatewayip 192.168.1.1
=> setenv ipaddr 192.168.1.2
=> setenv serverip 192.168.1.3
=> ping 192.168.1.3
 => tftp 0x82000000 zImage
=> tftp 0x88000000 am335x-boneblack.dtb
=> bootz 0x82000000 - 0x88000000

Thanks
Ashish











On Tue, May 7, 2019 at 10:44 PM Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, May 07, 2019 at 11:51:41AM -0500, Robert Nelson wrote:
> > On Sun, May 5, 2019 at 9:43 AM AshishKumar Mishra
> > <ashish.emailaddress@gmail.com> wrote:
> > >
> > > Hi All ,
> > > I am starting to learn Yocto & following the manual from the Yocto
> website
> > >
> > > I have added meta-ti to yocto and create the images
> > >
> > > Can team please provide some pointer to resolve the below error
> > > or let me know if i am doing any thing wong.
> > >
> > > When flashed the images on SD card , the uboot is struck with below
> mentioned error
> > >
> > >
> > > U-Boot#
> > > U-Boot#
> > > U-Boot#
> > > U-Boot SPL 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)
> > > reading args
> > > spl_load_image_fat_os: error reading image args, err - -1
> > > reading u-boot.img
> > > reading u-boot.img
> > >
> > >
> > > U-Boot 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)
> >
> > Clear out your eMMC, you have a really old build of u-boot installed
> > to eMMC that is blocking your new image..
>
> Yes, I even had that mentioned in the corresponding README:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-yocto-bsp/README.hardware#n134
>
> Denys
>
>
> > Regards,
> >
> > --
> > Robert Nelson
> > https://rcn-ee.com/
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--0000000000007f51e4058861d559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>HI Denys / Robert ,=
 <br></div><div><br></div><div>Thanks , got the board boot up now.</div><di=
v>Followed below mentioned steps ( just in case if any one face similar pro=
blem )</div><div><br></div><div>1) Erase the MMC</div><div>=C2=A0=C2=A0=C2=
=A0 =3D&gt; mmc dev 1<br>=C2=A0=C2=A0=C2=A0 =3D&gt; mmc erase 0 512<br><br>=
</div><div>2) Install TFTP server on host <a href=3D"https://askubuntu.com/=
questions/201505/how-do-i-install-and-run-a-tftp-server">https://askubuntu.=
com/questions/201505/how-do-i-install-and-run-a-tftp-server</a></div><div><=
br></div><div>3) Transfer the dtb &amp; zImage <br></div><div>=3D&gt; seten=
v gatewayip 192.168.1.1<br>=3D&gt; setenv ipaddr 192.168.1.2=C2=A0=C2=A0=C2=
=A0 <br>=3D&gt; setenv serverip 192.168.1.3<br>=3D&gt; ping 192.168.1.3<br>=
=C2=A0=3D&gt; tftp 0x82000000 zImage<br>=3D&gt; tftp 0x88000000 am335x-bone=
black.dtb<br>=3D&gt; bootz 0x82000000 - 0x88000000<br></div><div><br></div>=
<div>Thanks <br></div><div>Ashish</div><div><br></div><div><br></div><div>=
=C2=A0=C2=A0=C2=A0 <br></div><div><br></div><div><br></div><div><br></div><=
div><br></div><div><br></div><div><br></div><div><br></div></div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, May 7, 2019 at 10:44 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denys@t=
i.com">denys@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, May 07, 2019 at 11:51:41AM -0500, Robert Nelson =
wrote:<br>
&gt; On Sun, May 5, 2019 at 9:43 AM AshishKumar Mishra<br>
&gt; &lt;<a href=3D"mailto:ashish.emailaddress@gmail.com" target=3D"_blank"=
>ashish.emailaddress@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi All ,<br>
&gt; &gt; I am starting to learn Yocto &amp; following the manual from the =
Yocto website<br>
&gt; &gt;<br>
&gt; &gt; I have added meta-ti to yocto and create the images<br>
&gt; &gt;<br>
&gt; &gt; Can team please provide some pointer to resolve the below error<b=
r>
&gt; &gt; or let me know if i am doing any thing wong.<br>
&gt; &gt;<br>
&gt; &gt; When flashed the images on SD card , the uboot is struck with bel=
ow mentioned error<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; U-Boot#<br>
&gt; &gt; U-Boot#<br>
&gt; &gt; U-Boot#<br>
&gt; &gt; U-Boot SPL 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)<br>
&gt; &gt; reading args<br>
&gt; &gt; spl_load_image_fat_os: error reading image args, err - -1<br>
&gt; &gt; reading u-boot.img<br>
&gt; &gt; reading u-boot.img<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; U-Boot 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)<br>
&gt; <br>
&gt; Clear out your eMMC, you have a really old build of u-boot installed<b=
r>
&gt; to eMMC that is blocking your new image..<br>
<br>
Yes, I even had that mentioned in the corresponding README:<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-y=
octo-bsp/README.hardware#n134" rel=3D"noreferrer" target=3D"_blank">http://=
git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-yocto-bsp/README.ha=
rdware#n134</a><br>
<br>
Denys<br>
<br>
<br>
&gt; Regards,<br>
&gt; <br>
&gt; -- <br>
&gt; Robert Nelson<br>
&gt; <a href=3D"https://rcn-ee.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://rcn-ee.com/</a><br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
</blockquote></div>

--0000000000007f51e4058861d559--
