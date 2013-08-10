Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5917DE00406
	for <meta-ti@yoctoproject.org>; Fri,  9 Aug 2013 17:20:34 -0700 (PDT)
Received: by mail-ie0-f171.google.com with SMTP id 10so427693ied.30
	for <meta-ti@yoctoproject.org>; Fri, 09 Aug 2013 17:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4jirbEyFxSHFrRkGYJzzIK9gS2VH9HDTzAJJ0C1MPks=;
	b=btRpCrRVpJxst5ztEruuvZgoNtK8UrZ8hNfZLRmDhi+zYrNkkqx0QDd01KMxnLrT28
	/FQMMLCv+BlJHDJDlUImJUKc1ElI1lTeTJIGd+RKYRV3kXcIsj1pCXkpKnONsKN2yRwe
	GrdNJU6FntLKeEfShtQ8vDc4/jTrZEj+eKY+Oi/FM32JrOUSz6S/JBCvLZFEu5zu2FEk
	zg7D5YfkNSqkTiexQElRO/wBVZqU1bCmAoQAoKYfT7xPFGJ70RZzfFsZuNoL4VrfAKb6
	Dr4JmimXqCrXc/3yI1Q1FUxNlcEjtEWu+QjQZRSHKfcHbr3PVKHTeRt8yCOeCUIHwBIu
	6qfA==
MIME-Version: 1.0
X-Received: by 10.43.73.66 with SMTP id yr2mr5531840icb.66.1376094033954; Fri,
	09 Aug 2013 17:20:33 -0700 (PDT)
Received: by 10.43.83.9 with HTTP; Fri, 9 Aug 2013 17:20:33 -0700 (PDT)
In-Reply-To: <CALEed8ZHVy_e2z6aVBRRj2HkwZ8gfOAEs_Rf-KYfTopn20d5Eg@mail.gmail.com>
References: <CALEed8ZHVy_e2z6aVBRRj2HkwZ8gfOAEs_Rf-KYfTopn20d5Eg@mail.gmail.com>
Date: Sat, 10 Aug 2013 12:20:33 +1200
Message-ID: <CALEed8aQ+eWvvVLUyKVdd8BLknx77MAjgXrcjLfWz55dr3soLA@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Re: Beaglebone black not booting
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
X-List-Received-Date: Sat, 10 Aug 2013 00:20:35 -0000
Content-Type: multipart/alternative; boundary=001a11c1e71a124e6f04e38cdcaa

--001a11c1e71a124e6f04e38cdcaa
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am trying to get a Yocto + meta-ti build going for the beaglebone black,
but it only gets partway through the kernel boot, then fails with errors
relating to pin setup on MMC.

Is there a special target for the beaglebone black, I built using
MACHINE=beaglebone

I am building the minimal image.

Thanks,
Bernie


On Fri, Aug 9, 2013 at 8:36 PM, Bernard Mentink <bmentink@gmail.com> wrote:

> Hi All,
>
> I am trying to get a Yocto + meta-ti build going for the beaglebone black,
> but it only gets partway through the kernel boot, then fails with errors
> relating to pin setup on MMC.
>
> Is there a special target for the beaglebone black, I built using
> MACHINE=beaglebone
>
> I am building the minimal image.
>
> Thanks,
> Bernie
>

--001a11c1e71a124e6f04e38cdcaa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi All,</span><div style=3D"font-family:arial,sans-serif;font-size:13px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I am t=
rying to get a Yocto + meta-ti build going for the beaglebone black, but it=
 only gets partway through the kernel boot, then fails with errors relating=
 to pin setup on MMC.</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">Is there a special tar=
get for the beaglebone black, I built using MACHINE=3Dbeaglebone</div><div =
style=3D"font-family:arial,sans-serif;font-size:13px">
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I am b=
uilding the minimal image.</div><div style=3D"font-family:arial,sans-serif;=
font-size:13px"><br></div><div style=3D"font-family:arial,sans-serif;font-s=
ize:13px">
Thanks,</div><div style=3D"font-family:arial,sans-serif;font-size:13px">Ber=
nie</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote=
">On Fri, Aug 9, 2013 at 8:36 PM, Bernard Mentink <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bmentink@gmail.com" target=3D"_blank">bmentink@gmail.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi All,<div><br></div><div>=
I am trying to get a Yocto + meta-ti build going for the beaglebone black, =
but it only gets partway through the kernel boot, then fails with errors re=
lating to pin setup on MMC.</div>

<div><br></div><div>Is there a special target for the beaglebone black, I b=
uilt using MACHINE=3Dbeaglebone</div><div><br></div><div>I am building the =
minimal image.</div><div><br></div><div>Thanks,</div><div>Bernie</div></div=
>

</blockquote></div><br></div>

--001a11c1e71a124e6f04e38cdcaa--
