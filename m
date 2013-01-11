Return-Path: <daniel.toussaint@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86C47E0120B
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 20:56:25 -0800 (PST)
Received: by mail-wi0-f173.google.com with SMTP id hn17so1703732wib.0
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 20:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=4C0XpBmKT3E7g8PsJ4DupNOvRBcIctLT46EUF33eIMU=;
	b=P5W62hDCD54UjVJ61gknnCU7rI34x3z7X6ttbxSSwcdMTZ1rgTcmMumzHHnd4E+LEy
	aSO203OE49A3y6+OQE0f+b5hAM8zcXcqppUzalkb00owd2Na0y6MYBbZnLuDf5e5H7U2
	9EwHSQ3RkCUZfO3g++Ivq2jgzoyhGjwSB+BWO21z6s4owpnz/brnr+ARb+1EBhvExZvo
	YeMhJJzBo6FP0zjt7xVjmXdQa0QqgmoKSkYUlWPi98/0VsvVkN1U568ePJP/6Iqde4mG
	+KPP2u+RM4IWTJenqzoE0ZAFVt0Xi1xjhd5eAn+eIkzfUhcjorRi8AQ+OYskF4V01aqW
	hIfA==
MIME-Version: 1.0
Received: by 10.194.179.34 with SMTP id dd2mr118640377wjc.1.1357880184473;
	Thu, 10 Jan 2013 20:56:24 -0800 (PST)
Sender: daniel.toussaint@gmail.com
Received: by 10.227.27.218 with HTTP; Thu, 10 Jan 2013 20:56:24 -0800 (PST)
Date: Fri, 11 Jan 2013 12:56:24 +0800
X-Google-Sender-Auth: oVsv3OtA5-R9PUU7NKky_hyYgaw
Message-ID: <CADVYk4R5fRCAK936sNECUqL9imXbKwuPafbnbZi+baiqn+GfcA@mail.gmail.com>
From: Daniel Toussaint <daniel@dmhome.net>
To: meta-ti@yoctoproject.org
Subject: Inherit a kernel recipe for a custom am3517 board.
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
X-List-Received-Date: Fri, 11 Jan 2013 04:56:25 -0000
Content-Type: multipart/alternative; boundary=089e0141a0020b07b504d2fc1ee6

--089e0141a0020b07b504d2fc1ee6
Content-Type: text/plain; charset=ISO-8859-1

Dear List,

I have a custom AM3517 board, currently running the latest TI PSP kernel
with a custom board file and a couple of added drivers. The PSP kernel is
2.6, during board bringup, however, we are going to release the board with
a 3.x kernel.
The goal is to have a meta-<ourlayer> , combined with the yocto project and
meta-ti.
My question is,  what is the sanest way to create a maintainable recipe for
our kernel ? None of our patches have been submitted to anywhere, as the
board is still in debugging stage.

Greetings,


-- 
*Gtalk:* daniel.toussaint@gmail.com* **
Skype*: supertoussi  *
Cell:** +886-915-680-291*

--089e0141a0020b07b504d2fc1ee6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear List,=A0<div><br></div><div style>I have a custom AM3=
517 board, currently running the latest TI PSP kernel with a custom board f=
ile and a couple of added drivers. The PSP kernel is 2.6, during board brin=
gup, however, we are going to release the board with a 3.x kernel.=A0</div>
<div style>The goal is to have a meta-&lt;ourlayer&gt; , combined with the =
yocto project and meta-ti.=A0</div><div style>My question is, =A0what is th=
e sanest way to create a maintainable recipe for our kernel ? None of our p=
atches have been submitted to anywhere, as the board is still in debugging =
stage.=A0</div>
<div style><br></div><div style>Greetings,</div><div><br clear=3D"all"><div=
><br></div>-- <br><b>Gtalk:</b> <a href=3D"mailto:daniel.toussaint@gmail.co=
m" target=3D"_blank">daniel.toussaint@gmail.com</a><b> </b><b><br>Skype</b>=
: <a>supertoussi=A0 </a><b><br>
Cell:</b><i> <a href=3D"tel:%2B886-915-680-291" value=3D"+886915680291" tar=
get=3D"_blank">+886-915-680-291</a></i><br>
<br><br>
</div></div>

--089e0141a0020b07b504d2fc1ee6--
