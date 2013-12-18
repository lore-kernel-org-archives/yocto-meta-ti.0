Return-Path: <johnsonthomas@nanometrics.ca>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F97AE007F7
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 10:53:34 -0800 (PST)
Received: by mail-vb0-f47.google.com with SMTP id q12so34767vbe.6
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 10:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lYp8aEJtB7ECOzMj+kZ8rdbtm/1UO780mjMmwzCjZ94=;
	b=phcxnOdML3c4e1gM5/uye7HluB/N3v0WH5CXV2JfabpakIOGFu1ENqEDL+ZpZ4GFyR
	WfvEICNd/vuehpxG2GHH0rnp4BOtyrPx9fgnWdm8N1OS2gxlh3a+jOvkdaDK3rxROhm0
	rwYUhNoMxrATgW7NcripnwQ+GSeGYHtMrnxXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lYp8aEJtB7ECOzMj+kZ8rdbtm/1UO780mjMmwzCjZ94=;
	b=LsyO5UN91rvve+6uBOrI86ghYyg2Prp8Q1ce7bX29SK44+N7M0OtsieZpA9BMs8dkC
	SIzQWgMUhhrPZAcy9X4CCS1Na0rTef0TpsMlnvQadohi2hipr1BzoTf16lPJB4c58lvV
	+1y3mipd/Jyd5NG9uEYIufUbH9vKQxHU+O+Du32FEbuYHrqp1JgikQrRKgJmXdCf+D0W
	PUL8diHW9s+cW+q0d3mvEQNWrQLshnMsyOTlmpa5AwA50x/VH0E+SmJRbh2GcGtrHtwZ
	02JMGRBB2jpUP26LLgpPJ4IQeZrDrtQ4w6RetkNvSX8irrksqwko6MNx3RPR0jqGRFeh
	rAVQ==
X-Gm-Message-State: ALoCoQle0rhRZFqtVzqqlJCyjWHEIrALBtIrYyjiMC/jfQfcdMr2mmqJfcB4QaAXrOQ4jNDwLyhj
MIME-Version: 1.0
X-Received: by 10.52.31.227 with SMTP id d3mr7753660vdi.38.1387392814104; Wed,
	18 Dec 2013 10:53:34 -0800 (PST)
Received: by 10.52.34.197 with HTTP; Wed, 18 Dec 2013 10:53:34 -0800 (PST)
In-Reply-To: <20131218174223.GT24180@edge>
References: <CAL58Aehin5=s1tCLoonZScAQvq2Hp7nwb8zzc4TBpXTSVWfp+Q@mail.gmail.com>
	<20131218174223.GT24180@edge>
Date: Wed, 18 Dec 2013 13:53:34 -0500
Message-ID: <CAL58Aeg6f29LsVE66AXhtQb0iFU2B6Za_9NPSJW5A-kSajAbSQ@mail.gmail.com>
From: Johnson Thomas <johnsonthomas@nanometrics.ca>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Latest version of Poky compatible with meta-ti
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
X-List-Received-Date: Wed, 18 Dec 2013 18:53:35 -0000
Content-Type: multipart/alternative; boundary=bcaec5314425d9878704edd38fd1

--bcaec5314425d9878704edd38fd1
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

Thanks for the quick response. I will upgrade meta-ti to use dylan and poky
to either 9.0 or 10.0.

Thanks,
Johnson


On Wed, Dec 18, 2013 at 12:42 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Dec 18, 2013 at 12:36:29PM -0500, Johnson Thomas wrote:
> > Hi all.
> >
> > I have a Yocto project consisting of Poky (Danny-8.0.2), meta-ti (tag:
> > ti2013.04.00) and a custom BSP layer. I was looking at upgrading the Poky
> > version to maybe 9.0 or even 10.0. I was wondering, what is the latest
> > version of Poky that is compatible with meta-ti layer?. Also, is it
> > recommended to use the "Danny" branch as a stable version for meta-ti
> layer?
>
> Hi,
>
> Danny branch is quite old and hasn't been updated in long time (although
> you
> are using an older tag from meta-ti/danny). Currently active branches in
> meta-ti are dylan and master (dora and later). That would correspond to
> Poky
> releases version 9 and version 10. We are still using Dylan for our stable
> releases, but should be switching to Dora soon. So, you can use either
> Dylan
> or master from meta-ti, but I won't recommentd staying with Danny.
>
> --
> Denys
>

--bcaec5314425d9878704edd38fd1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Denys,<div><br></div><div>Thanks for the quick response=
. I will upgrade meta-ti to use dylan and poky to either 9.0 or 10.0.=A0</d=
iv><div><br></div><div>Thanks,</div><div>Johnson</div></div><div class=3D"g=
mail_extra">
<br><br><div class=3D"gmail_quote">On Wed, Dec 18, 2013 at 12:42 PM, Denys =
Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D=
"_blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<div class=3D"HOEnZb"><div class=3D"h5">On Wed, Dec 18, 2013 at 12:36:29PM =
-0500, Johnson Thomas wrote:<br>
&gt; Hi all.<br>
&gt;<br>
&gt; I have a Yocto project consisting of Poky (Danny-8.0.2), meta-ti (tag:=
<br>
&gt; ti2013.04.00) and a custom BSP layer. I was looking at upgrading the P=
oky<br>
&gt; version to maybe 9.0 or even 10.0. I was wondering, what is the latest=
<br>
&gt; version of Poky that is compatible with meta-ti layer?. Also, is it<br=
>
&gt; recommended to use the &quot;Danny&quot; branch as a stable version fo=
r meta-ti layer?<br>
<br>
</div></div>Hi,<br>
<br>
Danny branch is quite old and hasn&#39;t been updated in long time (althoug=
h you<br>
are using an older tag from meta-ti/danny). Currently active branches in<br=
>
meta-ti are dylan and master (dora and later). That would correspond to Pok=
y<br>
releases version 9 and version 10. We are still using Dylan for our stable<=
br>
releases, but should be switching to Dora soon. So, you can use either Dyla=
n<br>
or master from meta-ti, but I won&#39;t recommentd staying with Danny.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br></div>

--bcaec5314425d9878704edd38fd1--
