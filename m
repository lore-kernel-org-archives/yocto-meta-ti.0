Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16176E00947; Wed, 12 Aug 2015 21:26:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 923FCE007B1
	for <meta-ti@yoctoproject.org>; Wed, 12 Aug 2015 21:26:14 -0700 (PDT)
Received: by oio137 with SMTP id 137so20656023oio.0
	for <meta-ti@yoctoproject.org>; Wed, 12 Aug 2015 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=baMMJeNFBxy641Brl4sNlXg4Azzjdt4GXZirk0IrGj8=;
	b=kzUHYTJNCCOqTSJEmeMIb1sMXSPDvVdmX1yahEP+mF7ni8k3mL7G2Ped5yc8DacuRE
	qme6SzlqEcjequbXp+N1eX/cf772OHEuRZ1ZkQdrRoMd10/ZgBcyJv5AHk1Rlyn1LXZL
	x/j1NqgwjCJFvHkVnxUH2VY5RgUvjdFfY2rrVqdnY3Ts2XayZqYQDeBPe/QSZKwRFX0y
	oie4u6+4SL6rrNOpS843wbeqc+zFvn3zHRh3d4vZHqKhT5NsmircMONzwB8iNtg+14FD
	kqVUS9wYFB3GYlpTvvtOBzCvzgGpFl8b/AjRoXlejCZB+5gH3RMDimwNC2oD5HubbL6O
	9J/g==
X-Received: by 10.202.206.135 with SMTP id e129mr21957797oig.132.1439439973519;
	Wed, 12 Aug 2015 21:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.86.131 with HTTP; Wed, 12 Aug 2015 21:25:54 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 13 Aug 2015 16:25:54 +1200
Message-ID: <CADySD0GDcbUR7wRYgj1jnX4D24vhBg57SoTam+P326fLZuE1Lw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Valgrind doesn't give stack trace
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
X-List-Received-Date: Thu, 13 Aug 2015 04:26:15 -0000
Content-Type: multipart/alternative; boundary=001a113d31bc4c1970051d29bc8f

--001a113d31bc4c1970051d29bc8f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am using Valgrind coming from yocto on my AM335x-EVM kit.

But when I try to use valgrind, it doesn't give me stack trace. Following
is what I get :

root@am335x-evm:~# valgrind --tool=3Dmemcheck --leak-check=3Dyes
--track-origins=3Dyes --error-limit=3Dno /home/root/test
Checking /home/root/test for memory leaks..
=3D=3D1732=3D=3D Memcheck, a memory error detector
=3D=3D1732=3D=3D Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward e=
t al.
=3D=3D1732=3D=3D Using Valgrind-3.9.0 and LibVEX; rerun with -h for copyrig=
ht info
=3D=3D1732=3D=3D Command: /home/root/test
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D Invalid write of size 4
=3D=3D1732=3D=3D    at 0x8420: main (test.c:11)
=3D=3D1732=3D=3D  Address 0x4823060 is 0 bytes inside a block of size 4 fre=
e'd
=3D=3D1732=3D=3D    at 0x48109C4: free (in
/usr/lib/valgrind/vgpreload_memcheck-arm-linux.so)
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D HEAP SUMMARY:
=3D=3D1732=3D=3D     in use at exit: 4 bytes in 1 blocks
=3D=3D1732=3D=3D   total heap usage: 2 allocs, 1 frees, 8 bytes allocated
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D 4 bytes in 1 blocks are definitely lost in loss record 1 o=
f 1
=3D=3D1732=3D=3D    at 0x4811FE8: malloc (in
/usr/lib/valgrind/vgpreload_memcheck-arm-linux.so)
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D LEAK SUMMARY:
=3D=3D1732=3D=3D    definitely lost: 4 bytes in 1 blocks
=3D=3D1732=3D=3D    indirectly lost: 0 bytes in 0 blocks
=3D=3D1732=3D=3D      possibly lost: 0 bytes in 0 blocks
=3D=3D1732=3D=3D    still reachable: 0 bytes in 0 blocks
=3D=3D1732=3D=3D         suppressed: 0 bytes in 0 blocks
=3D=3D1732=3D=3D
=3D=3D1732=3D=3D For counts of detected and suppressed errors, rerun with: =
-v
=3D=3D1732=3D=3D ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 fro=
m 0)

=E2=80=8BHow to get stack trace ?

thanks
Ankur=E2=80=8B

--001a113d31bc4c1970051d29bc8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399"><div class=3D"gmail_default">Hi,</div>=
<div class=3D"gmail_default"><br></div><div class=3D"gmail_default">I am us=
ing Valgrind coming from yocto on my AM335x-EVM kit.</div><div class=3D"gma=
il_default"><br></div><div class=3D"gmail_default">But when I try to use va=
lgrind, it doesn&#39;t give me stack trace. Following is what I get :</div>=
<div class=3D"gmail_default"><br></div><div class=3D"gmail_default" style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif"><font color=3D"#33339=
9" face=3D"georgia, serif">root@am335x-evm:~# valgrind --tool=3Dmemcheck --=
leak-check=3Dyes --track-origins=3Dyes --error-limit=3Dno=C2=A0</font><span=
 style=3D"color:rgb(51,51,153);font-family:georgia,serif">/home/root/test</=
span><br></div><div class=3D"gmail_default"><div class=3D"gmail_default">Ch=
ecking /home/root/test for memory leaks..</div><div class=3D"gmail_default"=
>=3D=3D1732=3D=3D Memcheck, a memory error detector</div><div class=3D"gmai=
l_default">=3D=3D1732=3D=3D Copyright (C) 2002-2013, and GNU GPL&#39;d, by =
Julian Seward et al.</div><div class=3D"gmail_default">=3D=3D1732=3D=3D Usi=
ng Valgrind-3.9.0 and LibVEX; rerun with -h for copyright info</div><div cl=
ass=3D"gmail_default">=3D=3D1732=3D=3D Command: /home/root/test</div><div c=
lass=3D"gmail_default">=3D=3D1732=3D=3D</div><div class=3D"gmail_default">=
=3D=3D1732=3D=3D Invalid write of size 4</div><div class=3D"gmail_default">=
=3D=3D1732=3D=3D =C2=A0 =C2=A0at 0x8420: main (test.c:11)</div><div class=
=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0Address 0x4823060 is 0 bytes insi=
de a block of size 4 free&#39;d</div><div class=3D"gmail_default">=3D=3D173=
2=3D=3D =C2=A0 =C2=A0at 0x48109C4: free (in /usr/lib/valgrind/vgpreload_mem=
check-arm-linux.so)</div><div class=3D"gmail_default">=3D=3D1732=3D=3D</div=
><div class=3D"gmail_default">=3D=3D1732=3D=3D</div><div class=3D"gmail_def=
ault">=3D=3D1732=3D=3D HEAP SUMMARY:</div><div class=3D"gmail_default">=3D=
=3D1732=3D=3D =C2=A0 =C2=A0 in use at exit: 4 bytes in 1 blocks</div><div c=
lass=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0 total heap usage: 2 allocs, =
1 frees, 8 bytes allocated</div><div class=3D"gmail_default">=3D=3D1732=3D=
=3D</div><div class=3D"gmail_default">=3D=3D1732=3D=3D 4 bytes in 1 blocks =
are definitely lost in loss record 1 of 1</div><div class=3D"gmail_default"=
>=3D=3D1732=3D=3D =C2=A0 =C2=A0at 0x4811FE8: malloc (in /usr/lib/valgrind/v=
gpreload_memcheck-arm-linux.so)</div><div class=3D"gmail_default">=3D=3D173=
2=3D=3D</div><div class=3D"gmail_default">=3D=3D1732=3D=3D LEAK SUMMARY:</d=
iv><div class=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0 =C2=A0definitely lo=
st: 4 bytes in 1 blocks</div><div class=3D"gmail_default">=3D=3D1732=3D=3D =
=C2=A0 =C2=A0indirectly lost: 0 bytes in 0 blocks</div><div class=3D"gmail_=
default">=3D=3D1732=3D=3D =C2=A0 =C2=A0 =C2=A0possibly lost: 0 bytes in 0 b=
locks</div><div class=3D"gmail_default">=3D=3D1732=3D=3D =C2=A0 =C2=A0still=
 reachable: 0 bytes in 0 blocks</div><div class=3D"gmail_default">=3D=3D173=
2=3D=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 suppressed: 0 bytes in 0 blocks</div><d=
iv class=3D"gmail_default">=3D=3D1732=3D=3D</div><div class=3D"gmail_defaul=
t">=3D=3D1732=3D=3D For counts of detected and suppressed errors, rerun wit=
h: -v</div><div class=3D"gmail_default">=3D=3D1732=3D=3D ERROR SUMMARY: 2 e=
rrors from 2 contexts (suppressed: 0 from 0)</div></div><div style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif"><div class=3D"gmail_signature"=
><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div class=3D"gmail_default" s=
tyle=3D"font-family:georgia,serif;color:rgb(51,51,153)">=E2=80=8BHow to get=
 stack trace ?</div><div class=3D"gmail_default" style=3D"font-family:georg=
ia,serif;color:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;color:rgb(51,51,153)">thanks</div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;color:rgb(51,51,153)"=
>Ankur=E2=80=8B</div><div><br></div></div></div></div></div>
</div>

--001a113d31bc4c1970051d29bc8f--
