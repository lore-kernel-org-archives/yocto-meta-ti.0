Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62FC5E00796; Wed, 13 Aug 2014 02:31:16 -0700 (PDT)
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
	*      [209.85.192.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 894BCE00796
	for <meta-ti@yoctoproject.org>; Wed, 13 Aug 2014 02:31:15 -0700 (PDT)
Received: by mail-qg0-f48.google.com with SMTP id i50so10589539qgf.35
	for <meta-ti@yoctoproject.org>; Wed, 13 Aug 2014 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=eplf6W+lSprp8VY0sOWRB2vuGy0uR0d0Nny5KEZcJQo=;
	b=CFt6JM7y+CFDo6ZseUgPX/dtXb5ygg79e0EtqU+pT/7hvM7ePnMIO2+08ffZGP+NNL
	Fn9V769YL8MPaQrDeODhDFPrvphJBTfHC3HI7a7cPLmBRQS+8LGwLtTBYtLTc6dLWVtV
	PfuxNzZn/wJK11N0hCz+3DLTc+M5OzIZO4ZTtI3+RginjITLs4NDp7oxi4BrIKzwq3dJ
	wLdlgoKa5j9m+x8KEbXOTi20Bo6kPMExSPqGpR6CYfwQ/Kip9GAqZVYJMtgGUgzPoFmr
	TwwxCE4UqyVxP4uqkTlWP+3JGzq10Efp55+2EINsVV/trMQPhYKDH/gFGNbNAUyMH8/e
	5D3A==
X-Received: by 10.140.41.38 with SMTP id y35mr4396842qgy.69.1407922274903;
	Wed, 13 Aug 2014 02:31:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Wed, 13 Aug 2014 02:30:54 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 13 Aug 2014 06:30:54 -0300
Message-ID: <CAMCfZKGe8nmRK9H5FeNueredgfA4w=aaP0RhpPZaqhfXXWM6-g@mail.gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Beaglebone Black u-boot verified boot
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
X-List-Received-Date: Wed, 13 Aug 2014 09:31:16 -0000
Content-Type: multipart/alternative; boundary=001a11c135ce117fc405007f73d1

--001a11c135ce117fc405007f73d1
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I realized that the newer versions of u-boot introduced the verified boot
feature [1].
And the Beaglebone Black seems to be one of the reference platform for
testing it [2].

The described process is somewhat manual and I'd like to know if there is a
WIP or some planning to have this automated by Yocto. If not, I'd like to
help to discuss and implement this feature.

Any thoughts?

[1] - http://lwn.net/Articles/571031/
[2] -
http://git.denx.de/?p=u-boot.git;a=blob;f=doc/uImage.FIT/beaglebone_vboot.txt

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c135ce117fc405007f73d1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Folks,<div><br></div><div>I realized that the newer versio=
ns of u-boot introduced the verified boot feature [1].</div><div>And the Be=
aglebone Black seems to be one of the reference platform for testing it [2]=
.</div>

<div><br></div><div>The described process is somewhat manual and I&#39;d li=
ke to know if there is a WIP or some planning to have this automated by Yoc=
to. If not, I&#39;d like to help to discuss and implement this feature.</di=
v>

<div><br></div><div>Any thoughts?</div><div><br></div><div>[1] -=A0<a href=
=3D"http://lwn.net/Articles/571031/">http://lwn.net/Articles/571031/</a></d=
iv><div>[2] -=A0<a href=3D"http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3D=
doc/uImage.FIT/beaglebone_vboot.txt">http://git.denx.de/?p=3Du-boot.git;a=
=3Dblob;f=3Ddoc/uImage.FIT/beaglebone_vboot.txt</a></div>

<div><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></=
div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=
=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_med=
ium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blan=
k">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c135ce117fc405007f73d1--
