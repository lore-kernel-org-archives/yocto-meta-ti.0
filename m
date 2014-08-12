Return-Path: <eric.lee@embedian.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AAB9E0078E; Tue, 12 Aug 2014 00:00:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.41 listed in list.dnswl.org]
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EBFAE004F2
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 00:00:36 -0700 (PDT)
Received: by mail-pa0-f41.google.com with SMTP id rd3so12539716pab.28
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 00:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:organization:message-id
	:mime-version:content-type:thread-index:content-language;
	bh=5qU58r87WB840cjfgGj2Tr9eeJ7rU4ssWj9p1NDo98c=;
	b=EOTSQ3reCyd0vFb3bwDv9kg/slIsCWcrdkNymEQz88aMv9z6ymPJmzKmO1gCt1fOMh
	r5i/y2V+InWRrqVFSlgJhp3vihSHxJJCjV/bvj+k05r571FIhn3wwOgwY//Fr468yTEK
	kax4VNtZai9jLNbxjuIZwC3NtgV9iNYWRfI4KOJE0vYoMYBKIwTDk84QJ6rYxEmxONx5
	mtSwMAFcEXdw8mSYRKlmfxWkZiaGHQNKS2heZLbGD3ysO0ZL+h5mGlqScuOekl383F+m
	keuDIIvJu+l5SUB7Qd28Pa3epCeM4b5wSIMPP8oVwvQpeFp1vu+NpliHnv4t1T5BDrj1
	+ZNA==
X-Gm-Message-State: ALoCoQlVfj0TpoxlFnhb+At4/0P41NDn29PpqgffjdPcgI+y+tc2lJuxi4DcDCi+2GY4A8Exsp9R
X-Received: by 10.67.3.234 with SMTP id bz10mr2593001pad.111.1407826835599;
	Tue, 12 Aug 2014 00:00:35 -0700 (PDT)
Received: from eric (dns2.embedian.com. [59.124.115.44])
	by mx.google.com with ESMTPSA id yb4sm13499058pbb.9.2014.08.12.00.00.32
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 12 Aug 2014 00:00:35 -0700 (PDT)
From: "Eric Lee" <eric.lee@embedian.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 12 Aug 2014 15:00:22 +0800
Organization: Embedian, Inc.
Message-ID: <000001cfb5fb$1cafdd60$560f9820$@embedian.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac+1+xVnUaM6NrCTTW6qVuoPXpsKXA==
Subject: cryptodev build error with 3.15.y
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
X-List-Received-Date: Tue, 12 Aug 2014 07:00:41 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01CFB63E.2AD31D60"
Content-Language: zh-tw

------=_NextPart_000_0001_01CFB63E.2AD31D60
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Denys,

 

I built TI SDK7 with Linux kernel 3.15.y and got cryptodev compile error. I
knew that you have a fix for this. May I know where can I find your fix?
Thanks.

 

-Eric

 


------=_NextPart_000_0001_01CFB63E.2AD31D60
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 14 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Mincho;
	panose-1:2 2 6 9 4 3 5 8 3 5;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Microsoft JhengHei";
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Microsoft JhengHei";
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Consolas;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-TW link=3Dblue =
vlink=3Dpurple style=3D'text-justify-trim:punctuation'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:Consolas'>Hi =
Denys,<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:Consolas'><o:p>&nbsp;</o:p></span><=
/p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:Consolas'>I built TI SDK7 with =
Linux kernel 3.15.y and got cryptodev compile error. I knew that you =
have a fix for this. May I know where can I find your fix? =
Thanks.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:Consolas'><o:p>&nbsp;</o:p></span><=
/p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:Consolas'>-Eric<o:p></o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:Consolas'><o:p>&nbsp;</o:p></span><=
/p></div></body></html>

------=_NextPart_000_0001_01CFB63E.2AD31D60--
