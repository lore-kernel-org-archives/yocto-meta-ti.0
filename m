Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F997E00832; Mon, 24 Nov 2014 09:54:10 -0800 (PST)
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
	*      [209.85.192.53 listed in list.dnswl.org]
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46E1CE005B7
	for <meta-ti@yoctoproject.org>; Mon, 24 Nov 2014 09:53:57 -0800 (PST)
Received: by mail-qg0-f53.google.com with SMTP id q108so7012216qgd.26
	for <meta-ti@yoctoproject.org>; Mon, 24 Nov 2014 09:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=x+Bl0R1WqxPGXcAixt/26Z3B0ctFi8P6AiNIApGKpg0=;
	b=DA5gyF+gsoSubPvVUfzlSueFD3aGXHnfYK8NPsCpx6LCXn5FtKXhi2em/QdXBJb8lO
	4/5D05QudUGkt5D6D1Y2XFLicHYlHQTSBIySEul9GJUJVSTHvvRGE5zLOUkKa6YnZLwu
	+IGGs3HLMBGRIqvVgkzBlrRs3gi9QPul7ecVysuVtQATaz+KpmxmAmBCes6Cswr+sw6h
	b4gJkZAmGZspgzziwFLMAuIEMi5mhEX8kTiYcRWJ3kC2+dzBUPDRU8FGitx7rON+6FyH
	LGtaK/UpjVXIheUN8syqPyPRl7xkq1hE/karMph46smH4oQ314JWnWIhfsXKhdLowqod
	/uJQ==
X-Received: by 10.140.35.105 with SMTP id m96mr31078004qgm.8.1416851636605;
	Mon, 24 Nov 2014 09:53:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.20 with HTTP; Mon, 24 Nov 2014 09:53:36 -0800 (PST)
In-Reply-To: <20141124174322.GB2242@edge>
References: <CAMCfZKFbTOszNMe+5PdP29x_eJmwNmykwdFVxynh-3fijcGWZQ@mail.gmail.com>
	<20141124174322.GB2242@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 24 Nov 2014 15:53:36 -0200
Message-ID: <CAMCfZKGCu_mkbOESo+XihpXBxBJsWqYgRdEN_znZMHj4Lc6oeg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: AM1705 support
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
X-List-Received-Date: Mon, 24 Nov 2014 17:54:10 -0000
Content-Type: multipart/alternative; boundary=001a11c03cec7fdea705089e7a15

--001a11c03cec7fdea705089e7a15
Content-Type: text/plain; charset=ISO-8859-1

Denys,


On Mon, Nov 24, 2014 at 3:43 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Mon, Nov 24, 2014 at 03:10:50PM -0200, Diego Sueiro wrote:
> > Folks,
> >
> > I have a project with AM1705 processor and I couldn't found any specific
> > machine configurations for it.
> >
> > Looking at the link http://www.ti.com/tool/linuxezsdk-sitara when I try
> to
> > download it's SDK it points me to download AM18x SDK (
> >
> http://software-dl.ti.com/sitara_linux/esd/AM17xSDK/latest/index_FDS.html
> ).
> >
> > So, the question is. Is the AM1705 SDK and AM18x SDK the same?
>
> Yes, AM17x and AM18x are very similar - they use OMAP-L137 and OMAP-L138
> parts
> respectively. The differences are mostly in peripherals:
>
> http://www.ti.com/product/omap-l137
> http://www.ti.com/product/omap-l138
>
> From BSP perspective, you can use am180x-evm machine.


Thank you very much for the quick answer.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c03cec7fdea705089e7a15
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Denys,</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Mon, Nov 24, 2014 at 3:43 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Nov 24,=
 2014 at 03:10:50PM -0200, Diego Sueiro wrote:<br>
&gt; Folks,<br>
&gt;<br>
&gt; I have a project with AM1705 processor and I couldn&#39;t found any sp=
ecific<br>
&gt; machine configurations for it.<br>
&gt;<br>
&gt; Looking at the link <a href=3D"http://www.ti.com/tool/linuxezsdk-sitar=
a" target=3D"_blank">http://www.ti.com/tool/linuxezsdk-sitara</a> when I tr=
y to<br>
&gt; download it&#39;s SDK it points me to download AM18x SDK (<br>
&gt; <a href=3D"http://software-dl.ti.com/sitara_linux/esd/AM17xSDK/latest/=
index_FDS.html" target=3D"_blank">http://software-dl.ti.com/sitara_linux/es=
d/AM17xSDK/latest/index_FDS.html</a>).<br>
&gt;<br>
&gt; So, the question is. Is the AM1705 SDK and AM18x SDK the same?<br>
<br>
</span>Yes, AM17x and AM18x are very similar - they use OMAP-L137 and OMAP-=
L138 parts<br>
respectively. The differences are mostly in peripherals:<br>
<br>
<a href=3D"http://www.ti.com/product/omap-l137" target=3D"_blank">http://ww=
w.ti.com/product/omap-l137</a><br>
<a href=3D"http://www.ti.com/product/omap-l138" target=3D"_blank">http://ww=
w.ti.com/product/omap-l138</a><br>
<br>
From BSP perspective, you can use am180x-evm machine.</blockquote></div><br=
>Thank you very much for the quick answer.<br><br clear=3D"all"><div><div c=
lass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,</div><div><br></div=
>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D=
"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=
=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">=
www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></=
div></div>
</div></div>

--001a11c03cec7fdea705089e7a15--
