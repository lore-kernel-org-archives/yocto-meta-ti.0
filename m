Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE869E00828; Fri,  9 Jan 2015 10:54:23 -0800 (PST)
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
	*      [209.85.192.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68085E0070B
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 10:54:11 -0800 (PST)
Received: by mail-qg0-f51.google.com with SMTP id i50so10321957qgf.10
	for <meta-ti@yoctoproject.org>; Fri, 09 Jan 2015 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rTgIro44bWVaUYdec7ANz/RaTW/642+k5Zim/JS+n9Q=;
	b=ikpcAVCPeSmfncEWmn8hXE0IKxlzbgQKQ2tyG8RtfGOnl2oOj+gbTGAimZxgOGehpF
	jeA8TPyKR8+zKpDcro/G4aulpKkLomeC689ZuY5MyfqUn9T3MzvlSIxPGIECAN66RIlv
	oVNjKWb8UZy3x5b05ciQEW/7MZgNYGzlQyRtDeACMMoe5+9MHBC22lDlA+gjEMlfXLIX
	hOKEwSHivZoe7hQZA3msCT7B3n/EDL6BlQ9VLikbxcG7z05FVXakj/JAIMarjxnI9Y62
	GtghsWqoCBFvX5342xFC33fluWfrVpq3zPYBSxknLfr6BOs08qnfIo9xYCgQAJUHKJ9l
	PdtQ==
X-Received: by 10.140.16.50 with SMTP id 47mr28360081qga.105.1420829650258;
	Fri, 09 Jan 2015 10:54:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.44.10 with HTTP; Fri, 9 Jan 2015 10:53:49 -0800 (PST)
In-Reply-To: <20150109154106.GI4759@edge>
References: <CAMCfZKH_-v_S=mLiNLQVRZ_YmUYZgz1a6q8h_ZX5VRqfwjiESQ@mail.gmail.com>
	<20150109154106.GI4759@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 9 Jan 2015 16:53:49 -0200
Message-ID: <CAMCfZKGXE5QuH6ZXSnUvEO7P_8e1MX8J3red_3oxFSavTQf=RA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: pvrsrvkm failing on kernel 3.14.26 for am3359
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
X-List-Received-Date: Fri, 09 Jan 2015 18:54:23 -0000
Content-Type: multipart/alternative; boundary=001a11c1005a970fa0050c3caebf

--001a11c1005a970fa0050c3caebf
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks Carlos and Denys,

After the latest meta-ti update it is working.

Abra=E7os,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&utm_medium=3De=
-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

On Fri, Jan 9, 2015 at 1:41 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Diego,
>
> The fix finally got merged to the kernel yesterday and will be picked up =
by
> the recipe update I posted last night.
>
> --
> Denys
>
>
> On Fri, Jan 09, 2015 at 08:41:19AM -0200, Diego Sueiro wrote:
> > Folks,
> >
> > I have recently updated my meta-ti daisy branch and noticed that
> > omap3-sgx-modules are not being loaded.
> >
> > Here is the log for 3.14.26 kernel (from meta-ti commit
> > 1d46274416c3b50808590963bdb6c157d9d7c745):
> >
> > pvrsrvkm: Unknown symbol v7_dma_map_area (err 0)
> > pvrsrvkm: Unknown symbol v7_dma_flush_range (err 0)
> > insmod: ERROR: could not insert module
> > /lib/modules/3.14.26/kernel/drivers/gpu/pvr/pvrsrvkm.ko: Unknown symbol
> in
> > module
> > Could not find pvrsrvkm driver
> >
> >
> > The 3.14.25 kernel version (from meta-ti commit
> > 31348244882a8defb640af75119ba275d9915f09) is OK.
> >
> > I'm using the default kernel configuration.
> >
> >
> > Regards,
> >
> > --
> > *dS
> > Diego Sueiro
> >
> > Administrador do Embarcados
> > www.embarcados.com.br
> > <
> http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&utm_medium=3D=
e-mail&utm_campaign=3DAssinatura%20Email%20Diego
> >
> >
> > /*long live rock 'n roll*/
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--001a11c1005a970fa0050c3caebf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Carlos and Denys,<div><br></div><div>After the late=
st meta-ti update it is working.</div></div><div class=3D"gmail_extra"><br =
clear=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr"><div>Abr=
a=E7os,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador =
do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=3Dassi=
natura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%=
20Diego" target=3D"_blank">www.embarcados.com.br</a><br><br>/*long live roc=
k &#39;n roll*/<br></div></div></div>
<br><div class=3D"gmail_quote">On Fri, Jan 9, 2015 at 1:41 PM, Denys Dmytri=
yenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blan=
k">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Die=
go,<br>
<br>
The fix finally got merged to the kernel yesterday and will be picked up by=
<br>
the recipe update I posted last night.<br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
<br>
On Fri, Jan 09, 2015 at 08:41:19AM -0200, Diego Sueiro wrote:<br>
&gt; Folks,<br>
&gt;<br>
&gt; I have recently updated my meta-ti daisy branch and noticed that<br>
&gt; omap3-sgx-modules are not being loaded.<br>
&gt;<br>
&gt; Here is the log for 3.14.26 kernel (from meta-ti commit<br>
&gt; 1d46274416c3b50808590963bdb6c157d9d7c745):<br>
&gt;<br>
&gt; pvrsrvkm: Unknown symbol v7_dma_map_area (err 0)<br>
&gt; pvrsrvkm: Unknown symbol v7_dma_flush_range (err 0)<br>
&gt; insmod: ERROR: could not insert module<br>
&gt; /lib/modules/3.14.26/kernel/drivers/gpu/pvr/pvrsrvkm.ko: Unknown symbo=
l in<br>
&gt; module<br>
&gt; Could not find pvrsrvkm driver<br>
&gt;<br>
&gt;<br>
&gt; The 3.14.25 kernel version (from meta-ti commit<br>
&gt; 31348244882a8defb640af75119ba275d9915f09) is OK.<br>
&gt;<br>
&gt; I&#39;m using the default kernel configuration.<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; --<br>
&gt; *dS<br>
&gt; Diego Sueiro<br>
&gt;<br>
&gt; Administrador do Embarcados<br>
&gt; <a href=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarca=
dos.com.br</a><br>
</div></div>&gt; &lt;<a href=3D"http://www.embarcados.com.br/?utm_source=3D=
assinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Em=
ail%20Diego" target=3D"_blank">http://www.embarcados.com.br/?utm_source=3Da=
ssinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Ema=
il%20Diego</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt; /*long live rock &#39;n roll*/<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br>
</font></span></blockquote></div><br></div>

--001a11c1005a970fa0050c3caebf--
