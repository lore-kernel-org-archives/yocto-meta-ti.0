Received: from vadc01-egs01.gd-ms.com (vadc01-egs01.gd-ms.com [137.100.132.43])
 by mx.groups.io with SMTP id smtpd.web12.6327.1601063992227627195
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 12:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gd-ms.com, ip: 137.100.132.43, mailfrom: donald.usry@gd-ms.com)
IronPort-SDR: wj5gr7Y5Dhx1j1ioq+znS6AxpJ3ZTBaHdpqaPjshcX59KZtkFgY9MUxgetOXlxRHSBLgJGJQXo
 bPBWCTNMyEog==
Received: from unknown (HELO eadc-e-fmsprd01.eadc-e.gd-ais.com) ([10.96.30.97])
  by vadc01-egs01.gd-ms.com with ESMTP; 25 Sep 2020 15:59:51 -0400
Received: from VADC-MMB05.GD-MS.US (vadc-mmb05.gd-ms.us [10.132.100.65])
	by eadc-e-fmsprd01.eadc-e.gd-ais.com (Postfix) with ESMTPS id 6EBCEA6803C
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 19:59:51 +0000 (UTC)
Received: from VADC-MCA01.GD-MS.US (10.132.100.42) by VADC-MMB05.GD-MS.US
 (10.132.100.65) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Sep
 2020 15:59:50 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (137.100.132.86)
 by VADC-MCA01.GD-MS.US (10.132.100.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 25 Sep 2020 15:59:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=LiA2zn7Fd0JO+vFjJhtiL6uiKf2V644KbkH03hltohj/F7vDSDWKXfp5pUVA6IFSbV8GOQZf0S1qh5GB5DzL1adMv5hcyWYR5zhd2JdxTrf/2k7IJlUU7TYqmVx7Y3VO5wnKfYjVX1DXdG7b1cM4pe9kbaxuYpfM2dyy08/FVcUX2ZmUMkBYcSkgIQnexkUQRf2ooSJm5I1CagUU7eGlhvFU+BLRjGDF+ZGR0nQzD7b0tEGrTQDm22Mpb8HgTzzclWjF/uYGYWzD6Aes6jGLpdmqBZGeywDsF25lQWnQlT/GL7iJIAIaC54CKURQlDeHax1Q2Yz+yD0AUFc6Y41dZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Nvd3ph4BENU283dSqPtuouqQGLKq8iEuwZbc9pWZco=;
 b=kEotQzV+Zt6ukpC5SBhG949ii3T7aYf4sX00kARdFAAE8BdhtdKPotNz84Kjh7jVx6hq+iq5r47o9C9SwSlIj09ufuTd3tELkSdVtJjmR1hKUEW/XAcFLRUqgNVlhvQ+J4iykphinbqQfZu01iXzSDD9NTt2MyW1HtKyO5rjJgTLPhKQJNYkYcN3UDLMOKtXb7VHa4z7vuqj9V8AyJPWp+/SHXAXrsyro2vixxCX4JvspMB3COX8M36KVwvhc0ASSJ/ADNn3ATDzZXnf0BXDKFMHw5QCnnXhRwBrypkw1EVOcP3sHakF4Z9eo68TtHK+pHraBP4AYiOU7A9fuDuLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gd-ms.com; dmarc=pass action=none header.from=gd-ms.com;
 dkim=pass header.d=gd-ms.com; arc=none
Received: from SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:419::16)
 by SN5P110MB0429.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 25 Sep
 2020 19:59:48 +0000
Received: from SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM
 ([fe80::80a9:4dbf:36e:9b48]) by SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM
 ([fe80::80a9:4dbf:36e:9b48%10]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 19:59:48 +0000
From: "Donald.Usry@gd-ms.com" <Donald.Usry@gd-ms.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master] devtool fails on unpack of u-boot-ti-staging
Thread-Topic: [dunfell/master] devtool fails on unpack of u-boot-ti-staging
Thread-Index: AdaTdYr+yxqWftkKR+eREJIpY6ZoZgAAIT2A
Date: Fri, 25 Sep 2020 19:59:48 +0000
Message-ID: <SN5P110MB0366631DD60A75E7C0F4E29BAA360@SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM>
References: <SN5P110MB0366E5988B560EE5113264EDAA360@SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SN5P110MB0366E5988B560EE5113264EDAA360@SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=gd-ms.com;
x-originating-ip: [137.100.137.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e03022e1-243c-4c64-f406-08d8618d8ef0
x-ms-traffictypediagnostic: SN5P110MB0429:
x-microsoft-antispam-prvs: <SN5P110MB04296E7526791939C2C8BEF3AA360@SN5P110MB0429.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(26005)(71200400001)(186003)(7696005)(6506007)(9686003)(55016002)(86362001)(2940100002)(8936002)(6916009)(8676002)(498600001)(2906002)(166002)(83380400001)(66476007)(64756008)(5660300002)(66946007)(52536014)(66556008)(76116006)(66446008)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN5P110MB0366.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e03022e1-243c-4c64-f406-08d8618d8ef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 19:59:48.8574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7c5a26cf-ddf0-400c-9703-4070b4e3a54d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0429
X-OriginatorOrg: gd-ms.com
X-TM-SNTS-SMTP: 
	41B87330B0076753053E03DB0436009B36813B360DF346B782223C4E77F6EAFF2000:8
X-Content-Scanned: Fidelis Mail
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN5P110MB0366631DD60A75E7C0F4E29BAA360SN5P110MB0366NAMP_"

--_000_SN5P110MB0366631DD60A75E7C0F4E29BAA360SN5P110MB0366NAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Using 'devtool modify u-boot-ti-staging' fails on do_unpack with "Exception=
: ModuleNotFoundError: No module named '_sysconfigdata'". I pulled a fresh =
copy of Poky and tried 'devtool modify u-boot' with the default machine and=
 the same exception occurs. Performing 'devtool modify linux-ti-staging' yi=
elds no issues. I might need to contact the poky team about this since the =
issue exists for u-boot recipe, but I am basing my work off of meta-ti, so =
I figured I would start here.

Build Configuration:
BB_VERSION           =3D "1.46.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "arm-poky-linux-gnueabi"
MACHINE              =3D "am335x-evm"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "3.1.3"
TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU           =3D "hard"

meta
meta-poky            =3D "dunfell:012ad10a89a889c21e67c27dc37d22520212548f"
meta-ti              =3D "master:2e95912f57a66a6a6879b053ba08faec5a6e4500"
meta-arm
meta-arm-toolchain   =3D "dunfell:c4f04f3fb66f8f4365b08b553af8206372e90a63"
workspace            =3D "dunfell:012ad10a89a889c21e67c27dc37d22520212548f"

Initialising tasks: 100% |#################################################=
###########################################################################=
######################################| Time: 0:00:00
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% comple=
te)
NOTE: Executing Tasks
ERROR: Error executing a python function in exec_python_func() autogenerate=
d:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
*** 0002:devtool_post_unpack(d)
     0003:
File: '/home/dusry/workspace/poky/meta/classes/devtool-source.bbclass', lin=
eno: 68, function: devtool_post_unpack
     0064:}
     0065:
     0066:
     0067:python devtool_post_unpack() {
*** 0068:    import oe.recipeutils
     0069:    import shutil
     0070:    sys.path.insert(0, os.path.join(d.getVar('COREBASE'), 'script=
s', 'lib'))
     0071:    import scriptutils
     0072:    from devtool import setup_git_repo
File: '/home/dusry/workspace/poky/meta/lib/oe/recipeutils.py', lineno: 21, =
function: <module>
     0017:import shutil
     0018:import re
     0019:import fnmatch
     0020:import glob
*** 0021:import bb.tinfoil
     0022:
     0023:from collections import OrderedDict, defaultdict
     0024:from bb.utils import vercmp_string
     0025:
File: '/home/dusry/workspace/poky/bitbake/lib/bb/tinfoil.py', lineno: 19, f=
unction: <module>
     0015:from collections import OrderedDict, defaultdict
     0016:from functools import partial
     0017:
     0018:import bb.cache
*** 0019:import bb.cooker
     0020:import bb.providers
     0021:import bb.taskdata
     0022:import bb.utils
     0023:import bb.command
File: '/home/dusry/workspace/poky/bitbake/lib/bb/cooker.py', lineno: 25, fu=
nction: <module>
     0021:import bb, bb.exceptions, bb.command
     0022:from bb import utils, data, parse, event, cache, providers, taskd=
ata, runqueue, build
     0023:import queue
     0024:import signal
*** 0025:import prserv.serv
     0026:import pyinotify
     0027:import json
     0028:import pickle
     0029:import codecs
File: '/home/dusry/workspace/poky/bitbake/lib/prserv/serv.py', lineno: 7, f=
unction: <module>
     0003:#
     0004:
     0005:import os,sys,logging
     0006:import signal, time
*** 0007:from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestH=
andler
     0008:import threading
     0009:import queue
     0010:import socket
     0011:import io
File: '/usr/lib/python3.8/xmlrpc/server.py', lineno: 117, function: <module=
>
     0113:import socketserver
     0114:import sys
     0115:import os
     0116:import re
*** 0117:import pydoc
     0118:import traceback
     0119:try:
     0120:    import fcntl
     0121:except ImportError:
File: '/usr/lib/python3.8/pydoc.py', lineno: 370, function: <module>
     0366:    return module
     0367:
     0368:# ---------------------------------------------------- formatter =
base class
     0369:
*** 0370:class Doc:
     0371:
     0372:    PYTHONDOCS =3D os.environ.get("PYTHONDOCS",
     0373:                                "https://docs.python.org/%d.%d/li=
brary<https://docs.python.org/%25d.%25d/library>"
     0374:                                % sys.version_info[:2])
File: '/usr/lib/python3.8/pydoc.py', lineno: 400, function: Doc
     0396:        raise TypeError(message)
     0397:
     0398:    docmodule =3D docclass =3D docroutine =3D docother =3D docpro=
perty =3D docdata =3D fail
     0399:
*** 0400:    def getdocloc(self, object, basedir=3Dsysconfig.get_path('stdl=
ib')):
     0401:        """Return the location of module docs or None"""
     0402:
     0403:        try:
     0404:            file =3D inspect.getabsfile(object)
File: '/usr/lib/python3.8/sysconfig.py', lineno: 512, function: get_path
     0508:    """Return a path corresponding to the scheme.
     0509:
     0510:    ``scheme`` is the install scheme name.
     0511:    """
*** 0512:    return get_paths(scheme, vars, expand)[name]
     0513:
     0514:
     0515:def get_config_vars(*args):
     0516:    """With no arguments, return a dictionary of all configuratio=
n
File: '/usr/lib/python3.8/sysconfig.py', lineno: 502, function: get_paths
     0498:    ``scheme`` is the install scheme name. If not provided, it wi=
ll
     0499:    return the default scheme for the current platform.
     0500:    """
     0501:    if expand:
*** 0502:        return _expand_vars(scheme, vars)
     0503:    else:
     0504:        return _INSTALL_SCHEMES[scheme]
     0505:
     0506:
File: '/usr/lib/python3.8/sysconfig.py', lineno: 172, function: _expand_var=
s
     0168:def _expand_vars(scheme, vars):
     0169:    res =3D {}
     0170:    if vars is None:
     0171:        vars =3D {}
*** 0172:    _extend_dict(vars, get_config_vars())
     0173:
     0174:    for key, value in _INSTALL_SCHEMES[scheme].items():
     0175:        if os.name in ('posix', 'nt'):
     0176:            value =3D os.path.expanduser(value)
File: '/usr/lib/python3.8/sysconfig.py', lineno: 550, function: get_config_=
vars
     0546:
     0547:        if os.name =3D=3D 'nt':
     0548:            _init_non_posix(_CONFIG_VARS)
     0549:        if os.name =3D=3D 'posix':
*** 0550:            _init_posix(_CONFIG_VARS)
     0551:        # For backward compatibility, see issue19555
     0552:        SO =3D _CONFIG_VARS.get('EXT_SUFFIX')
     0553:        if SO is not None:
     0554:            _CONFIG_VARS['SO'] =3D SO
File: '/usr/lib/python3.8/sysconfig.py', lineno: 421, function: _init_posix
     0417:def _init_posix(vars):
     0418:    """Initialize the module as appropriate for POSIX systems."""
     0419:    # _sysconfigdata is generated at build time, see _generate_po=
six_vars()
     0420:    name =3D _get_sysconfigdata_name()
*** 0421:    _temp =3D __import__(name, globals(), locals(), ['build_time_v=
ars'], 0)
     0422:    build_time_vars =3D _temp.build_time_vars
     0423:    vars.update(build_time_vars)
     0424:
     0425:def _init_non_posix(vars):
Exception: ModuleNotFoundError: No module named '_sysconfigdata'

--_000_SN5P110MB0366631DD60A75E7C0F4E29BAA360SN5P110MB0366NAMP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Using &#8216;devtool modify u-boot-ti-staging&#8217;=
 fails on do_unpack with &#8220;Exception: ModuleNotFoundError: No module n=
amed '_sysconfigdata'&#8221;. I pulled a fresh copy of Poky and tried &#821=
6;devtool modify u-boot&#8217; with the default machine and the same except=
ion
 occurs. Performing &#8216;devtool modify linux-ti-staging&#8217; yields no=
 issues. I might need to contact the poky team about this since the issue e=
xists for u-boot recipe, but I am basing my work off of meta-ti, so I figur=
ed I would start here.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Build Configuration:<o:p></o:p></p>
<p class=3D"MsoNormal">BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;1.46.0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;x86_64-linux&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &q=
uot;universal&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;arm-poky-linux-gnueabi&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;am335x-evm&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D &quot;3.1.3&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D &quot;arm armv7a vfp thumb neon callconvention-hard&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal">TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;hard&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">meta-poky&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;dunfell:012ad10a89a889c21e67c27dc37d22520=
212548f&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;master:2e95912f57a66a6a6879b053=
ba08faec5a6e4500&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">meta-arm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">meta-arm-toolchain&nbsp;&nbsp; =3D &quot;dunfell:c4f=
04f3fb66f8f4365b08b553af8206372e90a63&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">workspace&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;dunfell:012ad10a89a889c21e67c27dc37d22520=
212548f&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Initialising tasks: 100% |##########################=
###########################################################################=
#############################################################| Time: 0:00:0=
0<o:p></o:p></p>
<p class=3D"MsoNormal">Sstate summary: Wanted 0 Found 0 Missed 0 Current 20=
 (0% match, 100% complete)<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Executing Tasks<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Error executing a python function in exec_pyt=
hon_func() autogenerated:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The stack trace of python calls that resulted in thi=
s exception/failure was:<o:p></o:p></p>
<p class=3D"MsoNormal">File: 'exec_python_func() autogenerated', lineno: 2,=
 function: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0001:<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0002:devtool_post_unpack(d)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0003:<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/home/dusry/workspace/poky/meta/classes/devto=
ol-source.bbclass', lineno: 68, function: devtool_post_unpack<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0064:}<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0065:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0066:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0067:python devtool_post_un=
pack() {<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0068:&nbsp;&nbsp;&nbsp; import oe.recipeutils<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0069:&nbsp;&nbsp;&nbsp; imp=
ort shutil<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0070:&nbsp; &nbsp;&nbsp;sys=
.path.insert(0, os.path.join(d.getVar('COREBASE'), 'scripts', 'lib'))<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0071:&nbsp;&nbsp;&nbsp; imp=
ort scriptutils<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0072:&nbsp;&nbsp;&nbsp; fro=
m devtool import setup_git_repo<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/home/dusry/workspace/poky/meta/lib/oe/recipe=
utils.py', lineno: 21, function: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0017:import shutil<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0018:import re<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0019:import fnmatch<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0020:import glob<o:p></o:p>=
</p>
<p class=3D"MsoNormal">*** 0021:import bb.tinfoil<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0022:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0023:from collections impor=
t OrderedDict, defaultdict<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0024:from bb.utils import v=
ercmp_string<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0025:<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/home/dusry/workspace/poky/bitbake/lib/bb/tin=
foil.py', lineno: 19, function: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0015:from collections impor=
t OrderedDict, defaultdict<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0016:from functools import =
partial<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0017:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0018:import bb.cache<o:p></=
o:p></p>
<p class=3D"MsoNormal">*** 0019:import bb.cooker<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0020:import bb.providers<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0021:import bb.taskdata<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0022:import bb.utils<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0023:import bb.command<o:p>=
</o:p></p>
<p class=3D"MsoNormal">File: '/home/dusry/workspace/poky/bitbake/lib/bb/coo=
ker.py', lineno: 25, function: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0021:import bb, bb.exceptio=
ns, bb.command<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0022:from bb import utils, =
data, parse, event, cache, providers, taskdata, runqueue, build<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0023:import queue<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0024:import signal<o:p></o:=
p></p>
<p class=3D"MsoNormal">*** 0025:import prserv.serv<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0026:import pyinotify<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0027:import json<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0028:import pickle<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0029:import codecs<o:p></o:=
p></p>
<p class=3D"MsoNormal">File: '/home/dusry/workspace/poky/bitbake/lib/prserv=
/serv.py', lineno: 7, function: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0003:#<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0004:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0005:import os,sys,logging<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0006:import signal, time<o:=
p></o:p></p>
<p class=3D"MsoNormal">*** 0007:from xmlrpc.server import SimpleXMLRPCServe=
r, SimpleXMLRPCRequestHandler<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0008:import threading<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0009:import queue<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0010:import socket<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0011:import io<o:p></o:p></=
p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/xmlrpc/server.py', lineno:=
 117, function: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0113:import socketserver<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0114:import sys<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0115:import os<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0116:import re<o:p></o:p></=
p>
<p class=3D"MsoNormal">*** 0117:import pydoc<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0118:import traceback<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0119:try:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0120:&nbsp;&nbsp;&nbsp; imp=
ort fcntl<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0121:except ImportError:<o:=
p></o:p></p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/pydoc.py', lineno: 370, fu=
nction: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0366:&nbsp;&nbsp;&nbsp; ret=
urn module<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0367:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0368:# --------------------=
-------------------------------- formatter base class<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0369:<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0370:class Doc:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0371:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0372:&nbsp;&nbsp;&nbsp; PYT=
HONDOCS =3D os.environ.get(&quot;PYTHONDOCS&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0373:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;<a href=3D"https://docs.python.org/%25d.%25d/library">=
https://docs.python.org/%d.%d/library</a>&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0374:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; % sys.version_info[:2])<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/pydoc.py', lineno: 400, fu=
nction: Doc<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0396:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; raise TypeError(message)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0397:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0398:&nbsp;&nbsp;&nbsp; doc=
module =3D docclass =3D docroutine =3D docother =3D docproperty =3D docdata=
 =3D fail<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0399:<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0400:&nbsp;&nbsp;&nbsp; def getdocloc(self, obje=
ct, basedir=3Dsysconfig.get_path('stdlib')):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0401:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;Return the location of module docs o=
r None&quot;&quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0402:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0403:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; try:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0404:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file =3D inspect.getabsfile(ob=
ject)<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/sysconfig.py', lineno: 512=
, function: get_path<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0508:&nbsp;&nbsp;&nbsp; &qu=
ot;&quot;&quot;Return a path corresponding to the scheme.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0509:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0510:&nbsp;&nbsp;&nbsp; ``s=
cheme`` is the install scheme name.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0511:&nbsp;&nbsp;&nbsp; &qu=
ot;&quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0512:&nbsp;&nbsp;&nbsp; return get_paths(scheme,=
 vars, expand)[name]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0513:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0514:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0515:def get_config_vars(*a=
rgs):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0516:&nbsp;&nbsp;&nbsp; &qu=
ot;&quot;&quot;With no arguments, return a dictionary of all configuration<=
o:p></o:p></p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/sysconfig.py', lineno: 502=
, function: get_paths<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0498:&nbsp;&nbsp;&nbsp; ``s=
cheme`` is the install scheme name. If not provided, it will<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0499:&nbsp;&nbsp;&nbsp; ret=
urn the default scheme for the current platform.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0500:&nbsp;&nbsp;&nbsp; &qu=
ot;&quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0501:&nbsp;&nbsp;&nbsp; if =
expand:<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0502:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
return _expand_vars(scheme, vars)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0503:&nbsp;&nbsp;&nbsp; els=
e:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0504:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return _INSTALL_SCHEMES[scheme]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0505:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0506:<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/sysconfig.py', lineno: 172=
, function: _expand_vars<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0168:def _expand_vars(schem=
e, vars):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0169:&nbsp;&nbsp;&nbsp; res=
 =3D {}<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0170:&nbsp;&nbsp;&nbsp; if =
vars is None:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0171:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; vars =3D {}<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0172:&nbsp;&nbsp;&nbsp; _extend_dict(vars, get_c=
onfig_vars())<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0173:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0174:&nbsp;&nbsp;&nbsp; for=
 key, value in _INSTALL_SCHEMES[scheme].items():<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0175:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if os.name in ('posix', 'nt'):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0176:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value =3D os.path.expanduser(v=
alue)<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/sysconfig.py', lineno: 550=
, function: get_config_vars<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0546:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0547:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if os.name =3D=3D 'nt':<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0548:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _init_non_posix(_CONFIG_VARS)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0549:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if os.name =3D=3D 'posix':<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0550:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; _init_posix(_CONFIG_VARS)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0551:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; # For backward compatibility, see issue19555<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0552:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; SO =3D _CONFIG_VARS.get('EXT_SUFFIX')<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0553:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if SO is not None:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0554:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _CONFIG_VARS['SO'] =3D SO<o:p>=
</o:p></p>
<p class=3D"MsoNormal">File: '/usr/lib/python3.8/sysconfig.py', lineno: 421=
, function: _init_posix<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0417:def _init_posix(vars):=
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0418:&nbsp;&nbsp;&nbsp; &qu=
ot;&quot;&quot;Initialize the module as appropriate for POSIX systems.&quot=
;&quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0419:&nbsp;&nbsp;&nbsp; # _=
sysconfigdata is generated at build time, see _generate_posix_vars()<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0420:&nbsp;&nbsp;&nbsp; nam=
e =3D _get_sysconfigdata_name()<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0421:&nbsp;&nbsp;&nbsp; _temp =3D __import__(nam=
e, globals(), locals(), ['build_time_vars'], 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0422:&nbsp;&nbsp;&nbsp; bui=
ld_time_vars =3D _temp.build_time_vars<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0423:&nbsp;&nbsp;&nbsp; var=
s.update(build_time_vars)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0424:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0425:def _init_non_posix(va=
rs):<o:p></o:p></p>
<p class=3D"MsoNormal">Exception: ModuleNotFoundError: No module named '_sy=
sconfigdata'<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN5P110MB0366631DD60A75E7C0F4E29BAA360SN5P110MB0366NAMP_--
