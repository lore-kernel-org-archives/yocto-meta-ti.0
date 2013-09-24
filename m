Return-Path: <leonid.iziumtsev@globallogic.com>
Received: from exprod5og113.obsmtp.com (exprod5og113.obsmtp.com [64.18.0.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4265E01571
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 23:27:55 -0700 (PDT)
Received: from mail-lb0-f177.google.com ([209.85.217.177]) (using TLSv1) by
	exprod5ob113.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUkEw6s8F1nhx9bsOgyBuEhmShHHBXwiO@postini.com;
	Mon, 23 Sep 2013 23:27:57 PDT
Received: by mail-lb0-f177.google.com with SMTP id w7so3375287lbi.36
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 23:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R918DpOkMyIPMaHPKlNwxGvHD+SA+Seybzc5Kh2KcQM=;
	b=acaGtoEsN3v2Lf4tyYgdpt8257wkf93GA4HJ2p8cDRsQIMUfZ9QvMQdxex4KyNuOO6
	XqgrZK1odrJ4PIfOaOO3CHH/ROFjAogwlyHOxU3ubMri1KGa1lvNhc2pDVMjgINNVbJl
	H37kvYeWQyVhMUry8qF/oYF68s1Vx4DKX+WHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=R918DpOkMyIPMaHPKlNwxGvHD+SA+Seybzc5Kh2KcQM=;
	b=dIWH9wlzlOpiZZV6fGg+It19lFPKaZiFA7yzv1gX+RT2vQd+MnApC21vWq9n2f2zGA
	JLMWgWlWRy+gJIJy+0gpQ51/6XTwxMXTjLkhacueNV8gyNFAVuTzb19IUqeVnl7tjC2Z
	Wt6aD6lcvSn6GpSEljyIjRMdVdgcV/W3UigLG+BoGOeRRLhQrrLOH1lwZnVB5M/P2D6c
	EWwlDCCHuaRSGbxqQLyCPSDPDB5Zep3zRz54nR0yE8OXjtggqUijjHWlN0/YRKUappq3
	p/rDiNZJPwQmLCBjFZCUJQ+2548VlMDBtU70Ke7Y9S7RMWUmaJQTKEHJLkEQGaltUtN7
	NOkw==
X-Gm-Message-State: ALoCoQkKURLXX7ceL+4nhif1S++yEkn48n9niS0em8LIaoMDBn6b6/Qv/Ydycgb9G7jK3a1Ji0JhAarrusMeRLq8JGAX5yCfbiqZ31HN77HJDWruKPoDCjw+V5xxP1xh1IECHDYwyngjbO03k+GOIM/5E4D6xbNuIiiWR24S0FFZ/YcqD3m9Sto=
X-Received: by 10.112.161.105 with SMTP id xr9mr78096lbb.40.1380004073638;
	Mon, 23 Sep 2013 23:27:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.112.161.105 with SMTP id xr9mr78083lbb.40.1380004073428;
	Mon, 23 Sep 2013 23:27:53 -0700 (PDT)
Received: by 10.114.177.136 with HTTP; Mon, 23 Sep 2013 23:27:53 -0700 (PDT)
In-Reply-To: <20130923132342.GA3456@edge>
References: <CAAtecJGYGsuMf807WCQ4c4Qt6LaE=39gEMXeKE_Z64eYZv4KXg@mail.gmail.com>
	<CAAtecJHF87AjpXtDQo0U5n_ah28SJF__m1xcqHbvFOLqvOaDcw@mail.gmail.com>
	<20130923132342.GA3456@edge>
Date: Tue, 24 Sep 2013 09:27:53 +0300
Message-ID: <CAAtecJHsGT547fjcK6GKVLr7gN5dPpse9y1eo-eqRorzDFh8AQ@mail.gmail.com>
From: Leonid Iziumtsev <leonid.iziumtsev@globallogic.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: omap5: 3d graphics hardware acceleration build
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
X-List-Received-Date: Tue, 24 Sep 2013 06:27:57 -0000
Content-Type: multipart/alternative; boundary=001a11c37d6495e74e04e71b3c8a

--001a11c37d6495e74e04e71b3c8a
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

Thank you for fast reply and clarification!


On Mon, Sep 23, 2013 at 4:23 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Mon, Sep 23, 2013 at 01:15:11PM +0300, Leonid Iziumtsev wrote:
> > Hi all,
> >
> > Pardon me if this list is not the right place to ask the questions and if
> > so, please poing me to the right one.
> >
> > I'm developer in Panasonic Inc. Currently working with OAMP5 (pandaboard
> > uevm) I'm trying to get build with 3D graphics hardware acceleration
> using
> > DirectFB (no X support recurred). In future hopefully going run some Qt
> > based UI.
> > In search I came across "meta-ti" layer.
> >
> > I'm new in yocto based build system so don't
> > completely understand: is it what I was looking for? Will it allow me to
> > get build with proper graphic support?
>
> Leonid,
>
> Yes, this is the correct layer for OMAP5 uEVM support. But 3D Graphics is
> not
> yet available - there were some patches being developed, but they haven't
> been
> finalized yet.
>
> --
> Denys
>



-- 

Name | Title
GlobalLogic
P +x.xxx.xxx.xxxx  M +x.xxx.xxx.xxxx  S skype
www.globallogic.com
<http://www.globallogic.com/>
http://www.globallogic.com/email_disclaimer.txt

--001a11c37d6495e74e04e71b3c8a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Denys,<br><br></div>Thank you for fast reply and c=
larification!<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gma=
il_quote">On Mon, Sep 23, 2013 at 4:23 PM, Denys Dmytriyenko <span dir=3D"l=
tr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&=
gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On M=
on, Sep 23, 2013 at 01:15:11PM +0300, Leonid Iziumtsev wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Pardon me if this list is not the right place to ask the questions and=
 if<br>
&gt; so, please poing me to the right one.<br>
&gt;<br>
&gt; I&#39;m developer in Panasonic Inc. Currently working with OAMP5 (pand=
aboard<br>
&gt; uevm) I&#39;m trying to get build with 3D graphics hardware accelerati=
on using<br>
&gt; DirectFB (no X support recurred). In future hopefully going run some Q=
t<br>
&gt; based UI.<br>
&gt; In search I came across &quot;meta-ti&quot; layer.<br>
&gt;<br>
&gt; I&#39;m new in yocto based build system so don&#39;t<br>
&gt; completely understand: is it what I was looking for? Will it allow me =
to<br>
&gt; get build with proper graphic support?<br>
<br>
</div></div>Leonid,<br>
<br>
Yes, this is the correct layer for OMAP5 uEVM support. But 3D Graphics is n=
ot<br>
yet available - there were some patches being developed, but they haven&#39=
;t been<br>
finalized yet.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><font siz=
e=3D"-1"><br><span style=3D"vertical-align:baseline;font-variant:normal;fon=
t-style:normal;font-size:12px;background-color:transparent;text-decoration:=
none;font-family:Arial;font-weight:bold">Name | Title</span><br>
<span style=3D"vertical-align:baseline;font-variant:normal;font-style:norma=
l;font-size:12px;background-color:transparent;text-decoration:none;font-fam=
ily:Arial;font-weight:normal">GlobalLogic</span><br><span style=3D"vertical=
-align:baseline;font-variant:normal;font-style:normal;font-size:12px;backgr=
ound-color:transparent;text-decoration:none;font-family:Arial;font-weight:n=
ormal">P +x.xxx.xxx.xxxx=A0=A0M +x.xxx.xxx.xxxx=A0=A0S=A0skype</span><br>
<a href=3D"http://www.globallogic.com/" target=3D"_blank"><span style=3D"fo=
nt-size:12px;font-family:Arial;color:#1155cc;background-color:transparent;f=
ont-weight:normal;font-style:normal;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline">www.globallogic.com</span></a><span style=
=3D"vertical-align:baseline;font-variant:normal;font-style:normal;font-size=
:12px;background-color:transparent;text-decoration:none;font-family:Arial;f=
ont-weight:normal"></span><br>
<a href=3D"http://www.globallogic.com/" target=3D"_blank"><span style=3D"fo=
nt-size:12px;font-family:Arial;color:#1155cc;background-color:transparent;f=
ont-weight:normal;font-style:normal;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline"></span></a><br>
<a href=3D"http://www.globallogic.com/email_disclaimer.txt" target=3D"_blan=
k"><span style=3D"font-size:11px;font-family:Arial;color:#1155cc;background=
-color:transparent;font-weight:normal;font-style:normal;font-variant:normal=
;text-decoration:underline;vertical-align:baseline">http://www.globallogic.=
com/email_disclaimer.txt</span></a><span style=3D"vertical-align:baseline;f=
ont-variant:normal;font-style:normal;font-size:11px;background-color:transp=
arent;text-decoration:none;font-family:Arial;font-weight:normal"></span></f=
ont>
</div>

--001a11c37d6495e74e04e71b3c8a--
