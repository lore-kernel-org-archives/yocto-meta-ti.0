Return-Path: <manuel.torres.fernandez@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5941E00786; Wed, 24 Sep 2014 01:53:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (manuel.torres.fernandez[at]gmail.com)
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
	*      [209.85.192.42 listed in list.dnswl.org]
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5889EE0034C
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 01:53:01 -0700 (PDT)
Received: by mail-qg0-f42.google.com with SMTP id z60so4401001qgd.15
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 01:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QirJWSA0ZlV8rX7WWzt7z2TmKzstVxPnF8qDdS23CJU=;
	b=YeRu29ZtkdRiTR7zD1Oqt30pAGRkOgiObJMp89MyGAZ5BpnHH0QlLIEtEdtuIwafvQ
	QEek0h2nkCtbSM1H8oFAf35/+q3WibjjE9pawjCGNJwIKUbxnC7pRVUkCoPMMLNmThVP
	8g6Db+7F0gQRWNrOLtDgXiFAxh+vHCpC6DiihBWEiLkKT9GPhH6GYzDWlIXfVKsKokpg
	t6g89sD/W0gT5GxBaG91mM7dtNpbDYalv2yYfHfUQXJlcUh60QWAMEeBHydTMZEO561b
	LWLhPasA9bnEzQU8aOjwsRmhopfc139qL57emq7L7B12t6v9I9aWWLnGWuZWBenFLe5w
	S0NA==
MIME-Version: 1.0
X-Received: by 10.140.22.177 with SMTP id 46mr7290332qgn.35.1411548780825;
	Wed, 24 Sep 2014 01:53:00 -0700 (PDT)
Received: by 10.224.212.74 with HTTP; Wed, 24 Sep 2014 01:53:00 -0700 (PDT)
Date: Wed, 24 Sep 2014 10:53:00 +0200
Message-ID: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
From: Manuel Torres <manuel.torres.fernandez@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Video encoding on OMAP4430
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
X-List-Received-Date: Wed, 24 Sep 2014 08:53:04 -0000
Content-Type: multipart/alternative; boundary=001a11c12fb8aa15f90503cbcfb9

--001a11c12fb8aa15f90503cbcfb9
Content-Type: text/plain; charset=UTF-8

Hello everyone,

I am using a Gumstix Duovero Zephyr, which is based on OMAP4430, and I
would like to use the OMAP video encoding capabilities.

I got this working with a Gumstix Overo IronStorm by adding "gstreamer-ti"
to the image recipe but, if I run this target with "duovero" as machine, I
get the following error:

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL svn://
gforge.ti.com/svn/dmai/;module=UNDEFINED_DMAIBRANCH;protocol=https;user=anonymous;pswd='',
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 1, output:
svn: E205000: Syntax error in revision argument 'UNDEFINED_SRCREV'

ERROR: Function failed: Fetcher failure for URL: 'svn://
gforge.ti.com/svn/dmai/;module=UNDEFINED_DMAIBRANCH;protocol=https;user=anonymous;pswd='''.
Unable to fetch URL from any source.

Does anyone know what is wrong? Should I add a different target to the
recipe?

--001a11c12fb8aa15f90503cbcfb9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello everyone,<br><br></div>I am using a G=
umstix Duovero Zephyr, which is based on OMAP4430, and I would like to use =
the OMAP video encoding capabilities.<br><br></div>I got this working with =
a Gumstix Overo IronStorm by adding &quot;gstreamer-ti&quot;=C2=A0 to the i=
mage recipe but, if I run this target with &quot;duovero&quot; as machine, =
I get the following error:<br><br>NOTE: Preparing runqueue<br>NOTE: Executi=
ng SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>WARNING: Failed to f=
etch URL svn://<a href=3D"http://gforge.ti.com/svn/dmai/;module=3DUNDEFINED=
_DMAIBRANCH;protocol=3Dhttps;user=3Danonymous;pswd=3D&#39;">gforge.ti.com/s=
vn/dmai/;module=3DUNDEFINED_DMAIBRANCH;protocol=3Dhttps;user=3Danonymous;ps=
wd=3D&#39;</a>&#39;, attempting MIRRORS if available<br>ERROR: Fetcher fail=
ure: Fetch command failed with exit code 1, output:<br>svn: E205000: Syntax=
 error in revision argument &#39;UNDEFINED_SRCREV&#39;<br><br>ERROR: Functi=
on failed: Fetcher failure for URL: &#39;svn://<a href=3D"http://gforge.ti.=
com/svn/dmai/;module=3DUNDEFINED_DMAIBRANCH;protocol=3Dhttps;user=3Danonymo=
us;pswd=3D&#39;&#39;">gforge.ti.com/svn/dmai/;module=3DUNDEFINED_DMAIBRANCH=
;protocol=3Dhttps;user=3Danonymous;pswd=3D&#39;&#39;</a>&#39;. Unable to fe=
tch URL from any source.<br><br></div>Does anyone know what is wrong? Shoul=
d I add a different target to the recipe?<br><div><br></div></div>

--001a11c12fb8aa15f90503cbcfb9--
