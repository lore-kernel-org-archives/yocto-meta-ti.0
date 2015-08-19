Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD7E1E00AE0; Wed, 19 Aug 2015 02:49:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [98.138.120.233 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm43-vm9.bullet.mail.ne1.yahoo.com
	(nm43-vm9.bullet.mail.ne1.yahoo.com [98.138.120.233])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5028AE00A3C
	for <meta-ti@yoctoproject.org>; Wed, 19 Aug 2015 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1439977747; bh=LJkzdkOcU5WFlh4iUnBpbgu7Rf+sF98lX/Z4v/kODtk=;
	h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
	b=hwQ4CogG5Wi6nTksj8oZVrDl8i8ZBp+pezJ64MwdHSdr9K9W3QLn84f8VCLTvnUuMJFZA0kzAInITk1W92pREFdgEupnVk3YiCBsSLS2PvI1cyZdP7gC9JOKCC+lQzrngqjrYCAc3I8OOHsVMB3pppegyyKf/Be8j8nuPM5AegrM0e3ltCQU/51A2Pn0Rz68zlElY8m8vyxUmZ49cs7TN5u30PXGVfSzS8tqPaOrE0gW81oU5l4sax2RSehaJqBDeBRQDjqQ+VnOSVSNabyJUwPNKvuUIRXrYlmcylSSmlBbBLEFHGlUZZPrZCaS3Ws6g53Z3M0Tk4ip2N1Z1l4WRQ==
Received: from [127.0.0.1] by nm43.bullet.mail.ne1.yahoo.com with NNFMP;
	19 Aug 2015 09:49:07 -0000
Received: from [98.138.226.180] by nm43.bullet.mail.ne1.yahoo.com with NNFMP;
	19 Aug 2015 09:46:25 -0000
Received: from [212.82.98.49] by tm15.bullet.mail.ne1.yahoo.com with NNFMP;
	19 Aug 2015 09:46:25 -0000
Received: from [212.82.98.83] by tm2.bullet.mail.ir2.yahoo.com with NNFMP;
	19 Aug 2015 09:46:25 -0000
Received: from [127.0.0.1] by omp1020.mail.ir2.yahoo.com with NNFMP;
	19 Aug 2015 09:46:25 -0000
X-Yahoo-Newman-Property: ymail-4
X-Yahoo-Newman-Id: 307847.52497.bm@omp1020.mail.ir2.yahoo.com
X-YMail-OSG: tjpI8iYVM1m40VxIOibLZbqJYj3e2Y5Hn4JqYQAuA.E94V_O0PjUp.5POg0hq.a
	6UvPa0OVexnfUujoOfnzbDDBktvMOpA9I_5xNc_HnU5W0objKPkR.srqvuxxvFkVsmlLLdvamyB7
	vhDdsBF320cMKTyqerW_1eoHQNAbBUnpDf4ytu3fEwtbYeUjYaTtA445Qre532fgua.adjTNw1WW
	T.N6jZfDEz0eSVnkFQ6tNMbU0iZKiUMtFJRUBrVdZLK29Pb2oJ3Ni1Z86X0GUWSiFNGYMtOZz7j2
	tzub7MtgX2zd1v8Vkh6_Ut.Y0JzKCB00_TreyOyrFQ3uGiuuqtbZhq3l42lZKQ7FShrjhyORVzSv
	k5Z_HlKTfBRdbnox7iP9at5TYxx4PnVOMOZTAqeGQ0j2xQNCUy0arT6xui3CZLZbVlLXH0eR_yae
	Y7kFn7vpyamMONjMD.DepNsE0ZPt5.xBb134pN9cWRwFESZU__w6rCC145h_eKu0JIUv_fissfHh
	M1_FndH8eBuwLv4G0kCw-
Received: by 217.12.9.14; Wed, 19 Aug 2015 09:46:24 +0000 
Date: Wed, 19 Aug 2015 09:46:24 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: Denys Dmytriyenko <denys@ti.com>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <2062145486.7469712.1439977584428.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <20150818221434.GH6542@edge>
References: <20150818221434.GH6542@edge>
MIME-Version: 1.0
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Aug 2015 09:49:11 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_7469711_1732819589.1439977584426"

------=_Part_7469711_1732819589.1439977584426
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thank you,
now my last question for this Topic:
When will this new version for 4.1 be realese ?
This mounth ? This year? Is there a date approximate date?
Is it possible to be involved in the programming of the libgles-omap3 drive=
r ?=C2=A0=20


------=_Part_7469711_1732819589.1439977584426
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:16px"><div id=3D"yui_3_16_0=
_1_1439976820126_10974"><span>Thank you,</span></div><div id=3D"yui_3_16_0_=
1_1439976820126_7447"><span></span><br></div><div id=3D"yui_3_16_0_1_143997=
6820126_10126" dir=3D"ltr"><span id=3D"yui_3_16_0_1_1439976820126_10125">no=
w my last question for this Topic:</span></div><div id=3D"yui_3_16_0_1_1439=
976820126_11001" dir=3D"ltr"><span></span><br></div><div id=3D"yui_3_16_0_1=
_1439976820126_6772" dir=3D"ltr"><span id=3D"yui_3_16_0_1_1439976820126_677=
1">When will this new version for 4.1 be realese ?<br>This mounth ? This ye=
ar? Is there a date approximate date?</span></div><span id=3D"yui_3_16_0_1_=
1439976820126_6768"><div id=3D"yiv0155454588yui_3_16_0_1_1439736393909_2061=
3" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439976820126_11000" dir=
=3D"ltr">Is it possible to be involved in the programming of the libgles-om=
ap3 driver ?</div></span>&nbsp; <br><div class=3D"qtdSeparateBR" id=3D"yui_=
3_16_0_1_1439976820126_12377"><br></div>     </div></body></html>

------=_Part_7469711_1732819589.1439977584426--
