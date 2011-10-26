Return-Path: <koen@beagleboard.org>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF024E005BB
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 02:19:58 -0700 (PDT)
Received: by faap14 with SMTP id p14so2097790faa.35
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 02:19:44 -0700 (PDT)
Received: by 10.223.16.82 with SMTP id n18mr57556448faa.2.1319620448496;
	Wed, 26 Oct 2011 02:14:08 -0700 (PDT)
Received: from [10.192.7.71] ([85.13.70.251])
	by mx.google.com with ESMTPS id y2sm3015691fag.12.2011.10.26.02.13.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 02:14:07 -0700 (PDT)
Message-Id: <401C78AA-E167-4727-BEBF-EF6D647A12B8@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>
In-Reply-To: <CA+T6QPmWEKLjZHV=tnQ+OMROc+s9h-TYy31ykoYHs6AzgPS3_A@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 26 Oct 2011 11:13:53 +0200
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<20111026053519.GA15391@denix.org>
	<CA+T6QPmWEKLjZHV=tnQ+OMROc+s9h-TYy31ykoYHs6AzgPS3_A@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 09:20:19 -0000
Content-Type: multipart/alternative; boundary=Apple-Mail-1--136666350

--Apple-Mail-1--136666350
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit


Op 26 okt 2011, om 08:44 heeft Jason Kridner het volgende geschreven:

> On Wed, Oct 26, 2011 at 1:35 AM, Denys Dmytriyenko <denis@denix.org>  
> wrote:
>> On Tue, Oct 25, 2011 at 07:13:14PM -0500, Joel A Fernandes wrote:
>>> Enable the PL2303 usb-to-serial driver required for serial output
>>> from the beaglebone tester.
>>
>> BTW, has anyone tried building kernel for am335x-evm lately? It  
>> appears broken
>> for me with bunch of unresolved symbols for musb... Doing bisect  
>> doesn't help
>> much, as the tree was rebased and no previous revs are available :(
>
> The lack of previous revs cost me about 24 hours of trying to figure
> out how to fix the repo and waiting for it to fetch, but I have only
> been trying to build for the Bone, not for the EVM.  My builds are
> currently failing on "lzop: command not found".

http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=21d8165f0ab973f0ce0f2588d2e97b99d885c786

linux-ti33x-psp 3.1rc8: use LZO compression for beaglebone to squeeze  
out some more ms for faster boot
make sure to have 'lzop' installed, no native recipe for that yet

So please 'apt-get install lzop' for the time being :)

--Apple-Mail-1--136666350
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><br><div><div>Op 26 okt 2011, =
om 08:44 heeft Jason Kridner het volgende geschreven:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>On =
Wed, Oct 26, 2011 at 1:35 AM, Denys Dmytriyenko &lt;<a =
href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; =
wrote:<br><blockquote type=3D"cite">On Tue, Oct 25, 2011 at 07:13:14PM =
-0500, Joel A Fernandes wrote:<br></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">Enable the PL2303 usb-to-serial =
driver required for serial =
output<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">from the beaglebone =
tester.<br></blockquote></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">BTW, has anyone =
tried building kernel for am335x-evm lately? It appears =
broken<br></blockquote><blockquote type=3D"cite">for me with bunch of =
unresolved symbols for musb... Doing bisect doesn't =
help<br></blockquote><blockquote type=3D"cite">much, as the tree was =
rebased and no previous revs are available :(<br></blockquote><br>The =
lack of previous revs cost me about 24 hours of trying to figure<br>out =
how to fix the repo and waiting for it to fetch, but I have only<br>been =
trying to build for the Bone, not for the EVM. &nbsp;My builds =
are<br>currently failing on "lzop: command not =
found".</div></blockquote><br></div><div><a =
href=3D"http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasin=
struments/commit/?id=3D21d8165f0ab973f0ce0f2588d2e97b99d885c786">http://gi=
t.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/=
?id=3D21d8165f0ab973f0ce0f2588d2e97b99d885c786</a></div><div><br></div><di=
v><span class=3D"Apple-style-span" style=3D"color: rgb(51, 51, 51); =
font-family: sans-serif; font-size: 13px; "><div class=3D"commit-subject" =
style=3D"font-weight: bold; font-size: 17px; margin-top: 1.5em; =
margin-right: 0em; margin-bottom: 0.5em; margin-left: 0em; padding-top: =
0em; padding-right: 0em; padding-bottom: 0em; padding-left: 0em; =
">linux-ti33x-psp 3.1rc8: use LZO compression for beaglebone to squeeze =
out some more ms for faster boot</div><div class=3D"commit-msg" =
style=3D"white-space: pre; font-family: monospace; ">make sure to have =
'lzop' installed, no native recipe for that yet</div><div =
class=3D"commit-msg" style=3D"white-space: pre; font-family: monospace; =
"><br></div><div class=3D"commit-msg" style=3D"white-space: pre; =
font-family: monospace; ">So please 'apt-get install lzop' for the time =
being :)</div></span></div></body></html>=

--Apple-Mail-1--136666350--
