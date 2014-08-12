Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 462A5E0079A; Tue, 12 Aug 2014 16:03:02 -0700 (PDT)
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
	*      [209.85.216.175 listed in list.dnswl.org]
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDDB6E00796
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 16:02:58 -0700 (PDT)
Received: by mail-qc0-f175.google.com with SMTP id w7so3468250qcr.6
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ezMddKGXcF/BQ7y94z2+wHFzjE94khiDf9BCJjpLYKI=;
	b=hlnSyNvdXkBq2Z45UifAq6mnOotg/2PaO2b/6AYAUr+D+sWhUAqMRzAMIqOEUTZIea
	IT2UNlyxAL8o8aH7c4IyavxlHPhlY1oI1NFyMIJmXO/K67AVYTUEmGuhnxRiiEiiSJt0
	9vFm6e18enRC7bMJzF2B1JvaH/2EUx8dt/f9kpmSNKpSMynsAOJYaHdtZldN0HVS368g
	pG7qXzQlhnNEACdThLx2rVt+I1FiKdi6sYi2LvK59ec2KsPW0rCohoQ6pFDlmteglCNU
	G6lkCtd8uoFaWjaslodwOofl4/k8DsqwDPZKJO4MZLi2GRrDWGHw36Sj7/n+ZxTVTcjh
	NgmQ==
X-Received: by 10.229.182.1 with SMTP id ca1mr1263856qcb.28.1407884578316;
	Tue, 12 Aug 2014 16:02:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Tue, 12 Aug 2014 16:02:38 -0700 (PDT)
In-Reply-To: <20140812222101.GB16009@piout.net>
References: <20140812020344.BF28052981@arago-project.org>
	<CAMCfZKFhAVNKZP2X5jATWOWwrtk4TdBK5VADsui+dTWACAHr9g@mail.gmail.com>
	<20140812151419.GF23523@edge> <20140812222101.GB16009@piout.net>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 12 Aug 2014 20:02:38 -0300
Message-ID: <CAMCfZKGNewfvERQczxPpEwDYGk21OvdLLPqzvL+BmLFoArsmRQ@mail.gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Alexandre Belloni : beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Tue, 12 Aug 2014 23:03:02 -0000
Content-Type: multipart/alternative; boundary=001a1133a0da2ce6b1050076accd

--001a1133a0da2ce6b1050076accd
Content-Type: text/plain; charset=ISO-8859-1

Hi Alexandre,

On Tue, Aug 12, 2014 at 7:21 PM, Alexandre Belloni <
alexandre.belloni@free-electrons.com> wrote:

> Hi,
>
> On 12/08/2014 at 11:14:19 -0400, Denys Dmytriyenko wrote :
> > > > diff --git a/conf/machine/beaglebone.conf
> b/conf/machine/beaglebone.conf
> > > > index 8a83a1a..0b4dce3 100644
> > > > --- a/conf/machine/beaglebone.conf
> > > > +++ b/conf/machine/beaglebone.conf
> > > > @@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
> > > >
> > > >  SERIAL_CONSOLE = "115200 ttyO0"
> > > >
> > > > -UBOOT_MACHINE = "am335x_evm_config"
> > > > +UBOOT_MACHINE = "am335x_boneblack"
> > > >
> > >
> > > There is a typo here. Must be "am335x_boneblack_config" instead of
> > > "am335x_boneblack"
> >
> > Goot catch, thanks!
> >
>
> I tried, both are working. I didn't think that patch would be merged
> that fast, sorry about that.
>

It did not worked for me. I had to put "am335x_boneblack_config"

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a1133a0da2ce6b1050076accd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Alexandre,</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 12, 2014 at 7:2=
1 PM, Alexandre Belloni <span dir=3D"ltr">&lt;<a href=3D"mailto:alexandre.b=
elloni@free-electrons.com" target=3D"_blank">alexandre.belloni@free-electro=
ns.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":1im" class=3D"" style=3D"overflow:hidden">Hi,<=
br>
<br>
On 12/08/2014 at 11:14:19 -0400, Denys Dmytriyenko wrote :<br>
<div class=3D"">&gt; &gt; &gt; diff --git a/conf/machine/beaglebone.conf b/=
conf/machine/beaglebone.conf<br>
&gt; &gt; &gt; index 8a83a1a..0b4dce3 100644<br>
&gt; &gt; &gt; --- a/conf/machine/beaglebone.conf<br>
&gt; &gt; &gt; +++ b/conf/machine/beaglebone.conf<br>
&gt; &gt; &gt; @@ -11,4 +11,4 @@ IMAGE_FSTYPES +=3D &quot;tar.gz&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0SERIAL_CONSOLE =3D &quot;115200 ttyO0&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -UBOOT_MACHINE =3D &quot;am335x_evm_config&quot;<br>
&gt; &gt; &gt; +UBOOT_MACHINE =3D &quot;am335x_boneblack&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; There is a typo here. Must be &quot;am335x_boneblack_config&quot;=
 instead of<br>
&gt; &gt; &quot;am335x_boneblack&quot;<br>
&gt;<br>
&gt; Goot catch, thanks!<br>
&gt;<br>
<br>
</div>I tried, both are working. I didn&#39;t think that patch would be mer=
ged<br>
that fast, sorry about that.</div></blockquote></div><br>It did not worked =
for me. I had to put &quot;am335x_boneblack_config&quot;<br><br clear=3D"al=
l"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Die=
go Sueiro<br>

<br>Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.br/=
?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DA=
ssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br><=
br>/*long live rock &#39;n roll*/<br>

</div></div>
</div></div>

--001a1133a0da2ce6b1050076accd--
