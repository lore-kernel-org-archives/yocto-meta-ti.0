Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 365B1E008D6; Mon, 24 Nov 2014 09:11:31 -0800 (PST)
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
	*      [209.85.216.173 listed in list.dnswl.org]
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C69A9E00832
	for <meta-ti@yoctoproject.org>; Mon, 24 Nov 2014 09:11:23 -0800 (PST)
Received: by mail-qc0-f173.google.com with SMTP id i17so7164470qcy.18
	for <meta-ti@yoctoproject.org>; Mon, 24 Nov 2014 09:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=CoJ/SnSzK0yGZRQBal0ZJL0xtPeH+sxQlhMyrtmT70A=;
	b=XwJLRONWlWNM7YQNF0LsW3YreVOsLvQx2/PJp3SmCUqIaIHcmBWPU0Dv3nyHXlN+sL
	3uC20/5uLRju45XprCA71DaDYiGxC8jISm5NGkZmUmXYWaEjNC6fCYnz4jVkCXtcrOrX
	0gmte96wWaUueF3oa1afQ5E/hoF22thWrDhutrcVow3Buri93/piZLelwMx5cTCUMT/f
	8pPAbSlq8mzIVLxtt3e7sh0bfkLHsKvAKVIg3cWvo3fvG9l5FzptsA5eBensIioZi6rQ
	Gq8BP4mJPRmxoVoxCJV03kPU9dPWjlSywNCZB+qvTnPxtGeRGT80RFexPJ3Hj2ims1jI
	LOlA==
X-Received: by 10.140.40.239 with SMTP id x102mr29700167qgx.69.1416849071154; 
	Mon, 24 Nov 2014 09:11:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.20 with HTTP; Mon, 24 Nov 2014 09:10:50 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 24 Nov 2014 15:10:50 -0200
Message-ID: <CAMCfZKFbTOszNMe+5PdP29x_eJmwNmykwdFVxynh-3fijcGWZQ@mail.gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: AM1705 support
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
X-List-Received-Date: Mon, 24 Nov 2014 17:11:31 -0000
Content-Type: multipart/alternative; boundary=001a11c12a1a963a5005089de171

--001a11c12a1a963a5005089de171
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I have a project with AM1705 processor and I couldn't found any specific
machine configurations for it.

Looking at the link http://www.ti.com/tool/linuxezsdk-sitara when I try to
download it's SDK it points me to download AM18x SDK (
http://software-dl.ti.com/sitara_linux/esd/AM17xSDK/latest/index_FDS.html).

So, the question is. Is the AM1705 SDK and AM18x SDK the same?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c12a1a963a5005089de171
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Folks,</div><div><br></div><div>I have a project with=
 AM1705 processor and I couldn&#39;t found any specific machine configurati=
ons for it.</div><div><br></div><div>Looking at the link=A0<a href=3D"http:=
//www.ti.com/tool/linuxezsdk-sitara">http://www.ti.com/tool/linuxezsdk-sita=
ra</a>=A0when I try to download it&#39;s SDK it points me to download AM18x=
 SDK (<a href=3D"http://software-dl.ti.com/sitara_linux/esd/AM17xSDK/latest=
/index_FDS.html">http://software-dl.ti.com/sitara_linux/esd/AM17xSDK/latest=
/index_FDS.html</a>).</div><div><br></div><div>So, the question is. Is the =
AM1705 SDK and AM18x SDK the same?</div><div><br></div><br clear=3D"all"><d=
iv><div class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,</div><div>=
<br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><=
a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;u=
tm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D=
"_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br=
></div></div></div>
</div>

--001a11c12a1a963a5005089de171--
